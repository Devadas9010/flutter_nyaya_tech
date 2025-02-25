// To parse this JSON data, do
//
//     final listCaseLogs = listCaseLogsFromJson(jsonString);

import 'dart:convert';

ListCaseLogs listCaseLogsFromJson(String str) => ListCaseLogs.fromJson(json.decode(str));

String listCaseLogsToJson(ListCaseLogs data) => json.encode(data.toJson());

class ListCaseLogs {
    int? status;
    bool? success;
    String? message;
    Data? data;

    ListCaseLogs({
        this.status,
        this.success,
        this.message,
        this.data,
    });

    factory ListCaseLogs.fromJson(Map<String, dynamic> json) => ListCaseLogs(
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
    List<CaseLogs>? records;

    Data({
        this.paginationInfo,
        this.records,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        paginationInfo: json["pagination_info"] == null ? null : PaginationInfo.fromJson(json["pagination_info"]),
        records: json["records"] == null ? [] : List<CaseLogs>.from(json["records"]!.map((x) => CaseLogs.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pagination_info": paginationInfo?.toJson(),
        "records": records == null ? [] : List<dynamic>.from(records!.map((x) => x.toJson())),
    };
}

class PaginationInfo {
    int? totalCaseLogss;
    int? totalPages;
    int? pageSize;
    int? currentPage;
    int? nextPage;
    dynamic prevPage;

    PaginationInfo({
        this.totalCaseLogss,
        this.totalPages,
        this.pageSize,
        this.currentPage,
        this.nextPage,
        this.prevPage,
    });

    factory PaginationInfo.fromJson(Map<String, dynamic> json) => PaginationInfo(
        totalCaseLogss: json["total_records"],
        totalPages: json["total_pages"],
        pageSize: json["page_size"],
        currentPage: json["current_page"],
        nextPage: json["next_page"],
        prevPage: json["prev_page"],
    );

    Map<String, dynamic> toJson() => {
        "total_records": totalCaseLogss,
        "total_pages": totalPages,
        "page_size": pageSize,
        "current_page": currentPage,
        "next_page": nextPage,
        "prev_page": prevPage,
    };
}

class CaseLogs {
    int? id;
    int? caseId;
    String? description;
    int? createdBy;
    DateTime? createdAt;

    CaseLogs({
        this.id,
        this.caseId,
        this.description,
        this.createdBy,
        this.createdAt,
    });

    factory CaseLogs.fromJson(Map<String, dynamic> json) => CaseLogs(
        id: json["id"],
        caseId: json["case_id"],
        description: json["description"],
        createdBy: json["created_by"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "case_id": caseId,
        "description": description,
        "created_by": createdBy,
        "created_at": createdAt?.toIso8601String(),
    };
}
