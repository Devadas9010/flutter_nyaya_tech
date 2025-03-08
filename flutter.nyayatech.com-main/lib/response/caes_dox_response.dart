// To parse this JSON data, do
//
//     final listCaseDox = listCaseDoxFromJson(jsonString);

import 'dart:convert';

ListCaseDox listCaseDoxFromJson(String str) => ListCaseDox.fromJson(json.decode(str));

String listCaseDoxToJson(ListCaseDox data) => json.encode(data.toJson());

class ListCaseDox {
    int? status;
    bool? success;
    String? message;
    Data? data;

    ListCaseDox({
        this.status,
        this.success,
        this.message,
        this.data,
    });

    factory ListCaseDox.fromJson(Map<String, dynamic> json) => ListCaseDox(
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
    List<Documents>? records;

    Data({
        this.paginationInfo,
        this.records,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        paginationInfo: json["pagination_info"] == null ? null : PaginationInfo.fromJson(json["pagination_info"]),
        records: json["records"] == null ? [] : List<Documents>.from(json["records"]!.map((x) => Documents.fromJson(x))),
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

class Documents {
    int? id;
    int? caseId;
    String? key;
    dynamic desc;
    String? fileName;
    int? fileSize;
    String? fileType;
    bool? isRequested;
    dynamic requestedBy;
    String? uploadStatus;
    String? verificationStatus;
    dynamic verifiedAt;
    dynamic verifiedBy;
    dynamic category;
    String? caseStage;
    String? caseSubStage;
    int? commentsCount;
    int? uploadedBy;
    DateTime? createdAt;
    dynamic updatedAt;
    dynamic deletedAt;
    String? downloadUrl;

    Documents({
        this.id,
        this.caseId,
        this.key,
        this.desc,
        this.fileName,
        this.fileSize,
        this.fileType,
        this.isRequested,
        this.requestedBy,
        this.uploadStatus,
        this.verificationStatus,
        this.verifiedAt,
        this.verifiedBy,
        this.category,
        this.caseStage,
        this.caseSubStage,
        this.commentsCount,
        this.uploadedBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.downloadUrl,
    });

    factory Documents.fromJson(Map<String, dynamic> json) => Documents(
        id: json["id"],
        caseId: json["case_id"],
        key: json["key"],
        desc: json["desc"],
        fileName: json["file_name"],
        fileSize: json["file_size"],
        fileType: json["file_type"],
        isRequested: json["is_requested"],
        requestedBy: json["requested_by"],
        uploadStatus: json["upload_status"],
        verificationStatus: json["verification_status"],
        verifiedAt: json["verified_at"],
        verifiedBy: json["verified_by"],
        category: json["category"],
        caseStage: json["case_stage"],
        caseSubStage: json["case_sub_stage"],
        commentsCount: json["comments_count"],
        uploadedBy: json["uploaded_by"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
        downloadUrl: json["download_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "case_id": caseId,
        "key": key,
        "desc": desc,
        "file_name": fileName,
        "file_size": fileSize,
        "file_type": fileType,
        "is_requested": isRequested,
        "requested_by": requestedBy,
        "upload_status": uploadStatus,
        "verification_status": verificationStatus,
        "verified_at": verifiedAt,
        "verified_by": verifiedBy,
        "category": category,
        "case_stage": caseStage,
        "case_sub_stage": caseSubStage,
        "comments_count": commentsCount,
        "uploaded_by": uploadedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
        "download_url": downloadUrl,
    };
}
