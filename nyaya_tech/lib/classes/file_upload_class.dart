class FileUploadClass {
  final String fileType;
  final String fileName;
  final int fileSize;
  final String ?fileContent;

  FileUploadClass({
    required this.fileType,
    required this.fileName,
    required this.fileSize,
     this.fileContent,
  });

  Map<String, dynamic> toJson() => {
        "file_type": fileType,
        "file_name": fileName,
        "file_size": fileSize,
        "file_content": fileContent,
      };
}
