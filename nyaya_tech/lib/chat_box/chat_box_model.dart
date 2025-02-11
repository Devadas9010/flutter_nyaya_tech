import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/chatbox_api.dart';
import 'package:nyaya_tech/responses/create_chat_response.dart';
import 'package:nyaya_tech/responses/get_all_chats_response.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'chat_box_widget.dart' show ChatBoxWidget;
import 'package:flutter/material.dart';

class ChatBoxModel extends FlutterFlowModel<ChatBoxWidget> {
  TextEditingController _messagecontroller = TextEditingController();

  List<ChatData> chatsData = [];
  String message = '';

  @override
  void initState(BuildContext context) {
    _messagecontroller = TextEditingController();
  }

  @override
  void dispose() {
    _messagecontroller.dispose();
  }

  Future<List<ChatData>?> fetchAllChatsData() async {
    CustomResponse<GetAllChatsResponse> response =
        await GetAllChatsApi().call();
    if (response.statusCode == 200) {
      chatsData = response.data!.data!.records!;
    } 

    else{
      return throw Exception('error');
    }
  }




  Future<void> fetchCreateChatData({
    required int case_id,
    required String message,
    required String type,
  }) async {
    CustomResponse<CreateChatResponse> response = await CreateChatApi()
        .call(case_id: case_id, message: message, type: type);

    if (response.statusCode == 200 || response.statusCode == 201) {
      message = response.data!.message.toString();
    } else {
      message = response.data!.message.toString();
    }
  }
}
