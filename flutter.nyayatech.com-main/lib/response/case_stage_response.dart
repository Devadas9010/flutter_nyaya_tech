import 'dart:convert';

CaseStageResponse caseStageResponseFromJson(String str) => CaseStageResponse.fromJson(json.decode(str));

String caseStageResponseToJson(CaseStageResponse data) => json.encode(data.toJson());

class CaseStageResponse {
    int? status;
    bool? success;
    String? message;
    List<Stages>? data;

    CaseStageResponse({
        this.status,
        this.success,
        this.message,
        this.data,
    });

    factory CaseStageResponse.fromJson(Map<String, dynamic> json) => CaseStageResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Stages>.from(json["data"]!.map((x) => Stages.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Stages {
    int? id;
    int? caseId;
    String? stage;
    String? subStage;
    DateTime? initiatedAt;
    bool? isCompleted;
    int? order;
    dynamic completedAt;
    DateTime? createdAt;
    dynamic updatedAt;

    Stages({
        this.id,
        this.caseId,
        this.stage,
        this.subStage,
        this.initiatedAt,
        this.isCompleted,
        this.order,
        this.completedAt,
        this.createdAt,
        this.updatedAt,
    });

    factory Stages.fromJson(Map<String, dynamic> json) => Stages(
        id: json["id"],
        caseId: json["case_id"],
        stage: json["stage"],
        subStage: json["sub_stage"],
        initiatedAt: json["initiated_at"] == null ? null : DateTime.parse(json["initiated_at"]),
        isCompleted: json["is_completed"],
        order: json["order"],
        completedAt: json["completed_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "case_id": caseId,
        "stage": stage,
        "sub_stage": subStage,
        "initiated_at": initiatedAt?.toIso8601String(),
        "is_completed": isCompleted,
        "order": order,
        "completed_at": completedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
    };
}
