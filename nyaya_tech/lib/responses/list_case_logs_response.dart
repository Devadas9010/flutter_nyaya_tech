import 'dart:convert';

ListCaseLogsResponse ListCaseLogsResponseFromJson(String str) => ListCaseLogsResponse.fromJson(json.decode(str));

String ListCaseLogsResponseToJson(ListCaseLogsResponse data) => json.encode(data.toJson());

class ListCaseLogsResponse {
    int? status;
    bool? success;
    String? message;
    Data? data;

    ListCaseLogsResponse({
        this.status,
        this.success,
        this.message,
        this.data,
    });

    factory ListCaseLogsResponse.fromJson(Map<String, dynamic> json) => ListCaseLogsResponse(
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
    List<LogsData>? records;

    Data({
        this.paginationInfo,
        this.records,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        paginationInfo: json["pagination_info"] == null ? null : PaginationInfo.fromJson(json["pagination_info"]),
        records: json["records"] == null ? [] : List<LogsData>.from(json["records"]!.map((x) => LogsData.fromJson(x))),
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
    int? nextPage;
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

class LogsData {
    int? id;
    int? caseId;
    String? description;
    int? createdBy;
    DateTime? createdAt;

    LogsData({
        this.id,
        this.caseId,
        this.description,
        this.createdBy,
        this.createdAt,
    });

    factory LogsData.fromJson(Map<String, dynamic> json) => LogsData(
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

