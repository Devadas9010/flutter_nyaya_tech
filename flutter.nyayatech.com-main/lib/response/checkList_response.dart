import 'dart:convert';

CheckListResponse checkListResponseFromJson(String str) => CheckListResponse.fromJson(json.decode(str));

String checkListResponseToJson(CheckListResponse data) => json.encode(data.toJson());

class CheckListResponse {
    int? status;
    bool? success;
    String? message;
    Data? data;

    CheckListResponse({
        this.status,
        this.success,
        this.message,
        this.data,
    });

    factory CheckListResponse.fromJson(Map<String, dynamic> json) => CheckListResponse(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    PaginationInfo? paginationInfo;
    List<CheckList>? records;

    Data({
        this.paginationInfo,
        this.records,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        paginationInfo: json["pagination_info"] == null ? null : PaginationInfo.fromJson(json["pagination_info"]),
        records: json["records"] == null ? [] : List<CheckList>.from(json["records"]!.map((x) => CheckList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pagination_info": paginationInfo?.toJson(),
        "records": records == null ? [] : List<dynamic>.from(records!.map((x) => x.toJson())),
    };
}

class PaginationInfo {
    int? totalRecords;
    int? totalPages;
    int? pageSize;
    int? currentPage;
    dynamic nextPage;
    dynamic prevPage;

    PaginationInfo({
        this.totalRecords,
        this.totalPages,
        this.pageSize,
        this.currentPage,
        this.nextPage,
        this.prevPage,
    });

    factory PaginationInfo.fromJson(Map<String, dynamic> json) => PaginationInfo(
        totalRecords: json["total_records"],
        totalPages: json["total_pages"],
        pageSize: json["page_size"],
        currentPage: json["current_page"],
        nextPage: json["next_page"],
        prevPage: json["prev_page"],
    );

    Map<String, dynamic> toJson() => {
        "total_records": totalRecords,
        "total_pages": totalPages,
        "page_size": pageSize,
        "current_page": currentPage,
        "next_page": nextPage,
        "prev_page": prevPage,
    };
}

class CheckList {
    int? id;
    String? desc;
    String? status;
    int? createdBy;
    int? caseId;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;

    CheckList({
        this.id,
        this.desc,
        this.status,
        this.createdBy,
        this.caseId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory CheckList.fromJson(Map<String, dynamic> json) => CheckList(
        id: json["id"],
        desc: json["desc"],
        status: json["status"],
        createdBy: json["created_by"],
        caseId: json["case_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "desc": desc,
        "status": status,
        "created_by": createdBy,
        "case_id": caseId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
