/// 错误体信息
class ErrorMessageModel {
  int? statusCode;
  String? error;
  String? message;

  ErrorMessageModel({this.statusCode, this.error, this.message});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode: json['statusCode'] as int?,
      error: json['error'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'error': error,
        'message': message,
      };
}
