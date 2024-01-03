class ErrorModel {
  final String error;

  ErrorModel({
    required this.error,
  });

  ErrorModel.fromJson(Map<String, dynamic> json) : error = json['error'];
}
