// To parse this JSON data, do
//
//     final listofCheckListResponse = listofCheckListResponseFromJson(jsonString);

import 'dart:convert';

ListofCheckListResponse listofCheckListResponseFromJson(String str) => ListofCheckListResponse.fromJson(json.decode(str));

String listofCheckListResponseToJson(ListofCheckListResponse data) => json.encode(data.toJson());

class ListofCheckListResponse {
    int? status;
    bool? success;
    String? message;
    Data? data;

    ListofCheckListResponse({
        this.status,
        this.success,
        this.message,
        this.data,
    });

    factory ListofCheckListResponse.fromJson(Map<String, dynamic> json) => ListofCheckListResponse(
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
    List<CheckListData>? records;

    Data({
        this.paginationInfo,
        this.records,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        paginationInfo: json["pagination_info"] == null ? null : PaginationInfo.fromJson(json["pagination_info"]),
        records: json["records"] == null ? [] : List<CheckListData>.from(json["records"]!.map((x) => CheckListData.fromJson(x))),
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

class CheckListData {
    int? id;
    String? desc;
    String? status;
    int? createdBy;
    int? caseId;
    DateTime? createdAt;
    String? type;
    DateTime? updatedAt;
    dynamic deletedAt;

    CheckListData({
        this.id,
        this.desc,
        this.status,
        this.createdBy,
        this.caseId,
        this.createdAt,
        this.type,
        this.updatedAt,
        this.deletedAt,
    });

    factory CheckListData.fromJson(Map<String, dynamic> json) => CheckListData(
        id: json["id"],
        desc: json["desc"],
        status: json["status"],
        createdBy: json["created_by"],
        caseId: json["case_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        type: json["type"],
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
        "type": type,
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
