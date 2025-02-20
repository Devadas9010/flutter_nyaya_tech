import 'package:nyaya_tech/components/chat_card_component.dart';
import 'package:nyaya_tech/data_components/shared_preference.dart';
import 'package:nyaya_tech/data_components/text_field_components.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'chat_box_model.dart';
export 'chat_box_model.dart';

class ChatBoxWidget extends StatefulWidget {
  const ChatBoxWidget({super.key});

  @override
  State<ChatBoxWidget> createState() => _ChatBoxWidgetState();
}

class _ChatBoxWidgetState extends State<ChatBoxWidget> {
  TextEditingController _messagecontroller = TextEditingController();
  late ChatBoxModel _model;
  late Future<void> _future;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatBoxModel());
    _future = fetchData();
    _messagecontroller = TextEditingController();
  }

  Future<void> fetchData() async {
    await _model.fetchAllChatsData();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        // floatingActionButton: SizedBox(
        //   height: 50,
        //   width: 50,
        //   child: Builder(
        //     builder: (context) => FloatingActionButton(
        //       shape: const RoundedRectangleBorder(
        //           borderRadius: BorderRadius.all(Radius.zero)),
        //       onPressed: () {
        //         showPopover(
        //             context: context,
        //             bodyBuilder: (context) => Container(
        //                   padding: const EdgeInsets.only(top: 30, bottom: 20),
        //                   child: Column(
        //                     mainAxisSize: MainAxisSize.min,
        //                     children: [
        //                       MenuItem(
        //                         text: 'Case Details',
        //                         color: Colors.white.withOpacity(0.5),
        //                         ontap: () {
        //                           Navigator.pushReplacement(
        //                             context,
        //                             PageTransition(
        //                               type: PageTransitionType.fade,
        //                               child: const ViewCaseWidget(),
        //                             ),
        //                           );
        //                         },
        //                       ),
        //                       MenuItem(
        //                           text: 'Files',
        //                           color: Colors.white.withOpacity(0.5),
        //                           ontap: () {
        //                             Navigator.pushReplacement(
        //                                 context,
        //                                 PageTransition(
        //                                   type: PageTransitionType.fade,
        //                                   child: const FilesWidget(),
        //                                 ));
        //                           }),
        //                       MenuItem(
        //                         text: 'Chat Box',
        //                         color: Colors.white.withOpacity(1.0),
        //                         ontap: () {
        //                           Navigator.pushReplacement(
        //                             context,
        //                             PageTransition(
        //                               type: PageTransitionType.fade,
        //                               child: const ChatBoxWidget(),
        //                             ),
        //                           );
        //                         },
        //                       ),
        //                       MenuItem(
        //                         text: 'Notes',
        //                         color: Colors.white.withOpacity(0.5),
        //                         ontap: () {
        //                           Navigator.pushReplacement(
        //                             context,
        //                             PageTransition(
        //                               type: PageTransitionType.fade,
        //                               child: const NotesScreenWidget(),
        //                             ),
        //                           );
        //                         },
        //                       ),
        //                       MenuItem(
        //                         text: 'Hearing Summary',
        //                         color: Colors.white.withOpacity(0.5),
        //                         ontap: () {
        //                           Navigator.pushReplacement(
        //                             context,
        //                             PageTransition(
        //                               type: PageTransitionType.fade,
        //                               child: const HearingSummaryWidget(),
        //                             ),
        //                           );
        //                         },
        //                       ),
        //                       MenuItem(
        //                         text: 'Logs',
        //                         color: Colors.white.withOpacity(0.5),
        //                         ontap: () {
        //                           Navigator.pushReplacement(
        //                             context,
        //                             PageTransition(
        //                               type: PageTransitionType.fade,
        //                               child: const LogsWidget(),
        //                             ),
        //                           );
        //                         },
        //                       ),
        //                     ].divide(const SizedBox(height: 16)),
        //                   ),
        //                 ),
        //             direction: PopoverDirection.left,
        //             width: 250,
        //             height: 230,
        //             arrowHeight: 15,
        //             arrowWidth: 30,
        //             backgroundColor: Colors.black);
        //       },
        //       backgroundColor: Colors.black,
        //       elevation: 8,
        //       child:
        //           const Icon(Icons.menu_rounded, color: Colors.white, size: 32),
        //     ),
        //   ),
        // ),
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        context.pushNamed('View_case');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.arrow_back,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Chat Box',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'DM Sans',
                            color: const Color(0xFF181616),
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            lineHeight: 1.6,
                          ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.help_outline_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: _future,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(color: Colors.black),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('No connection'),
                      );
                    } else {
                      return _model.chatsData.isNotEmpty
                          ? ListView.builder(
                              reverse:
                                  true, // Ensures latest message appears at the bottom
                              itemCount: _model.chatsData.length,
                              itemBuilder: (context, index) {
                                final chatData = _model.chatsData[index];

                                return Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Align(
                                    alignment: chatData.message!.isNotEmpty
                                        ? Alignment
                                            .centerRight // Align right for sender
                                        : Alignment
                                            .centerLeft, // Align left for receiver
                                    child:
                                        ChatCardComponent(chatData: chatData),
                                  ),
                                );
                              },
                            )
                          : const Center(child: Text('No Chat'));
                    }
                  },
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Divider(
                    thickness: 1,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        8.0, 8.0, 8.0, 8.0),
                    child: TextFieldComponent(
                      controller: _messagecontroller,
                      hintText: "Type message",
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          SizedBox(width: 8.0), // Spacing
                          Icon(Icons.mic_none, color: Colors.black, size: 24.0),
                          SizedBox(width: 16.0),
                          Icon(Icons.image_outlined,
                              color: Colors.black, size: 24.0),
                          SizedBox(width: 16.0),
                        ],
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 2),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (_messagecontroller.text.trim().isEmpty) {
                              return isLoading; // If message is empty, do nothing and don't show loading
                            }

                            setState(() {
                              isLoading =
                                  true; // Start loading only if there's a message
                            });

                            await _model.fetchCreateChatData(
                              case_id: SharedPrefernce.getcaseId(),
                              message: _messagecontroller.text.trim(),
                              type: "MESSAGES",
                            );

                            await fetchData();

                            setState(() {
                              isLoading =
                                  false; // Stop loading after the process is done
                              _messagecontroller.text = ''; // Clear the message
                            });
                          },
                          text: '',
                          options: FFButtonOptions(
                            color: Colors.black,
                            width: 20.0, // Adjust button size as needed
                            height: 30.0,
                            padding: EdgeInsets.zero,
                            iconPadding: EdgeInsets.zero,
                          ),
                          icon: SvgPicture.asset(
                            'assets/images/send_icon.svg',
                            fit: BoxFit.none,
                            width: 30.0, // Adjust size
                            height: 30.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ].divide(const SizedBox(height: 24.0)),
          ),
        ),
      ),
    );
  }
}
