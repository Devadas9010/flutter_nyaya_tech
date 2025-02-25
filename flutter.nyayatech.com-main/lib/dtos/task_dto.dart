class TaskModuleAttachmentsDto {
  final String originalName;
  final String type;
  final int size;
  String? imageId;

  TaskModuleAttachmentsDto({
    required this.originalName,
    required this.type,
    required this.size,
    this.imageId,
  });

  Map<String, dynamic> toJson() {
    return {
      "original_name": this.originalName,
      "type": this.type,
      "size": this.size,
    };
  }
}
