import 'package:get/get.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/response/checkList_response.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class CheckListComponent extends StatelessWidget {
  final CheckList? checkList;
  const CheckListComponent({super.key, this.checkList});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        SharedPrefernce.setCheckListId(checkList!.id.toString());
        Get.toNamed(Routes.viewCheckList);
      },
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          border: Border.all(
            color: Color(0xFFDBDBDB),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.square_outlined,
                  color: FlutterFlowTheme.of(context).primaryText, size: 24),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${checkList!.desc}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'DM Sans',
                            color: Color(0xFF181616),
                            fontSize: 14,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ],
                ),
              ),
            ].divide(SizedBox(width: 12)),
          ),
        ),
      ),
    );
  }
}
