import 'package:nyaya_tech/checklist/view_checklist_widget.dart';
import 'package:nyaya_tech/components/checklist_card_model.dart';
import 'package:nyaya_tech/data_components/shared_preference.dart';
import 'package:nyaya_tech/responses/List_of_checklist_response.dart';
import 'package:nyaya_tech/responses/view_checklist_response.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class ChecklistCardWidget extends StatelessWidget {
  final CheckListData checklist;

  const ChecklistCardWidget({super.key, required this.checklist});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const ViewChecklistWidget(),
          ),
        );

        SharedPrefernce.setchecklistid(checklist.id.toString());
        print('checklist id -- ${SharedPrefernce.getchecklistid()}');
        print('cl id -- ${SharedPrefernce.getclid()}');
        print('checklist response -- ${SharedPrefernce.getResponse()}');
         

        
      },
      child: Container(
        width: 200,
        height: 60,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          border: Border.all(
            color: const Color(0xFFDBDBDB),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.square_outlined,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 18,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    checklist.desc ?? '--',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'DM Sans',
                          color: const Color(0xFF181616),
                          fontSize: 15,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
