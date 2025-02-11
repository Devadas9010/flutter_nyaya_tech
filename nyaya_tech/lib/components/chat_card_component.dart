import 'package:flutter/material.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/responses/get_all_chats_response.dart';

class ChatCardComponent extends StatelessWidget {
  final ChatData chatData;
  const ChatCardComponent({super.key, required this.chatData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      //height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0),
                        border: Border.all(color: const Color(0x4A000000)),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Text(
                        chatData.message ?? '--',
                        style: TextStyle(
                          fontFamily: 'DM Sans',
                          color: const Color(0xFF181616),
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Container(
                    width: 40.0,
                    height: 40.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.network(
                      'https://picsum.photos/seed/952/600',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
