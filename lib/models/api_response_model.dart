import 'dart:convert';

class ApiResponseModel<T> {
  final bool isSuccess;
  final T? data;
  final String? message;

  ApiResponseModel({
    required this.isSuccess,
    this.data,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'isSuccess': isSuccess});
    result.addAll({'data': data});
    result.addAll({'message': message});

    return result;
  }

  factory ApiResponseModel.fromMap(Map<String, dynamic> map) {
    return ApiResponseModel<T>(
      isSuccess: map['isSuccess'] ?? false,
      data: map['data'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiResponseModel.fromJson(String source) =>
      ApiResponseModel.fromMap(json.decode(source));
}
