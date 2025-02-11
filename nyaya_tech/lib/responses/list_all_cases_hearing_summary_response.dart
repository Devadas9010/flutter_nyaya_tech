import 'dart:convert';

ListAllCasesHearingSummaryResponse listAllCasesHearingSummaryResponseFromJson(
        String str) =>
    ListAllCasesHearingSummaryResponse.fromJson(json.decode(str));

String listAllCasesHearingSummaryResponseToJson(
        ListAllCasesHearingSummaryResponse data) =>
    json.encode(data.toJson());

class ListAllCasesHearingSummaryResponse {
  int? status;
  bool? success;
  String? message;
  Data? data;

  ListAllCasesHearingSummaryResponse({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory ListAllCasesHearingSummaryResponse.fromJson(
          Map<String, dynamic> json) =>
      ListAllCasesHearingSummaryResponse(
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
  List<ListCaseSummary>? records;

  Data({
    this.paginationInfo,
    this.records,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        paginationInfo: json["pagination_info"] == null
            ? null
            : PaginationInfo.fromJson(json["pagination_info"]),
        records: json["records"] == null
            ? []
            : List<ListCaseSummary>.from(json["records"]!
                .map((x) => ListCaseSummary.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination_info": paginationInfo?.toJson(),
        "records": records == null
            ? []
            : List<dynamic>.from(records!.map((x) => x.toJson())),
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

class ListCaseSummary {
  int? id;
  int? caseId;
  DateTime? date;
  String? note;
  int? createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  ListCaseSummary({
    this.id,
    this.caseId,
    this.date,
    this.note,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory ListCaseSummary.fromJson(Map<String, dynamic> json) =>
      ListCaseSummary(
        id: json["id"],
        caseId: json["case_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        note: json["note"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "case_id": caseId,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "note": note,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}
