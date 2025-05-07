import 'dart:convert';

class ErrorResponse {
  final String status;
  final String message;

  ErrorResponse({
    required this.status,
    required this.message,
  });
  static ErrorResponse errorFromJson(String str) =>
      ErrorResponse.fromJson(json.decode(str));

  static String errorToJson(ErrorResponse data) => json.encode(data.toJson());
  ErrorResponse copyWith({
    String? status,
    String? message,
  }) =>
      ErrorResponse(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
