class ResponseModel {
  ResponseModel({
    required this.data,
    required this.hasError,
    this.errorCode,
  });
  final String data;
  final bool hasError;
  final int? errorCode;
}