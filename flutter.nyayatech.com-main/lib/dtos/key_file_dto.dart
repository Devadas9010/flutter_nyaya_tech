class KeyFileDto {
  final int caseId;
  final String fileType;
  final String fileName;
  final num fileSize;
  final String key;

  KeyFileDto({
    required this.caseId,
    required this.fileType,
    required this.fileName,
    required this.fileSize,
    required this.key,
  });

  Map<String, dynamic> toJson() => {
        "case_id": caseId,
        "file_type": fileType,
        "file_name": fileName,
        "file_size": fileSize,
        "key": key,
      };
}
