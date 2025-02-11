// To parse this JSON data, do
//
//     final getListDocumentResponse = getListDocumentResponseFromJson(jsonString);

import 'dart:convert';

GetListDocumentResponse getListDocumentResponseFromJson(String str) => GetListDocumentResponse.fromJson(json.decode(str));

String getListDocumentResponseToJson(GetListDocumentResponse data) => json.encode(data.toJson());

class GetListDocumentResponse {
    int? status;
    bool? success;
    String? message;
    Data? data;

    GetListDocumentResponse({
        this.status,
        this.success,
        this.message,
        this.data,
    });

    factory GetListDocumentResponse.fromJson(Map<String, dynamic> json) => GetListDocumentResponse(
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
    List<ListDocumentData>? records;

    Data({
        this.paginationInfo,
        this.records,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        paginationInfo: json["pagination_info"] == null ? null : PaginationInfo.fromJson(json["pagination_info"]),
        records: json["records"] == null ? [] : List<ListDocumentData>.from(json["records"]!.map((x) => ListDocumentData.fromJson(x))),
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

class ListDocumentData {
    int id;
    int? caseId;
    String? filename;
    String? key;
    int? fileSize;
    String? fileType;
    dynamic createdBy;
    DateTime? createdAt;
    dynamic updatedAt;
    dynamic deletedAt;

    ListDocumentData({
       required this.id,
        this.caseId,
        this.filename,
        this.key,
        this.fileSize,
        this.fileType,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory ListDocumentData.fromJson(Map<String, dynamic> json) => ListDocumentData(
        id: json["id"],
        caseId: json["case_id"],
        filename: json["filename"],
        key: json["key"],
        fileSize: json["file_size"],
        fileType: json["file_type"],
        createdBy: json["created_by"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "case_id": caseId,
        "filename": filename,
        "key": key,
        "file_size": fileSize,
        "file_type": fileType,
        "created_by": createdBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
    };
}






