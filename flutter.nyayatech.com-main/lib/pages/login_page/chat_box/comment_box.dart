import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/response/get_comments_response.dart';

class CommentBox extends StatelessWidget {
  final Commentdata commentData;
  const CommentBox({super.key, required this.commentData});

  @override
  Widget build(BuildContext context) {
    final currentUserId = SharedPrefernce.getprofileid();
    final isCurrentUser = currentUserId == commentData.user!.id;

    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: toBeginningOfSentenceCase(commentData.message.toString()) ??
            commentData.message.toString(),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'DM Sans',
              color: const Color(0xFF181616),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
      ),
      textDirection: Directionality.of(context),
      maxLines: null,
    )..layout(maxWidth: MediaQuery.of(context).size.width - 200);

    final isMultiLine = textPainter.didExceedMaxLines;

    return Row(
      mainAxisAlignment:
          isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isCurrentUser) ...[
          Container(
            width: 25,
            height: 25,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child:commentData.user!.profilePic!=null ?Image.network(
                '${commentData.user!.profilePic}',
                fit: BoxFit.cover) :SvgPicture.asset('assets/images/no_Profile_user.svg', fit: BoxFit.cover),
          ),
          const SizedBox(width: 8),
        ],
        Flexible(
          child: Padding(
            padding: isCurrentUser
                ? EdgeInsets.only(left: 100)
                : EdgeInsets.only(right: 100),
            child: Container(
              decoration: BoxDecoration(
                color: isCurrentUser
                    ? Color(0XFFA1D2FF).withOpacity(0.25)
                    : Colors.white,
                borderRadius: BorderRadius.circular(0),
                border: Border.all(
                    color: isCurrentUser
                        ? Color(0XFFCADBEB)
                        : const Color(0XFF000000).withOpacity(0.1)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize:
                          isMultiLine ? MainAxisSize.max : MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (!isCurrentUser)
                          Text(
                            commentData.user!.firstName ?? 'Unknown',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                    fontFamily: 'DM Sans',
                                    color: const Color(0xFF181616),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                          ),
                        Text(
                          DateFormat('h:mm a')
                              .format(commentData.createdAt!.toLocal()),
                          style: TextStyle(
                            color: Color(0XFF898989),
                            fontFamily: 'DM Sans',
                            fontSize: 12,
                          ),
                        ),
                      ].divide(SizedBox(width: 14)),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      toBeginningOfSentenceCase(
                              commentData.message.toString()) ??
                          commentData.message.toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'DM Sans',
                            color: const Color(0xFF181616),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
