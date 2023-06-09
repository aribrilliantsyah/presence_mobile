import 'dart:convert';

import 'package:presence_alpha/payload/data/auth_data.dart';
import 'package:presence_alpha/payload/response/base_response.dart';

class AuthResponse extends BaseResponse {
  final AuthData? data;

  AuthResponse({
    required bool status,
    required String message,
    this.data,
  }) : super(status: status, message: message);

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? AuthData.fromJson(json['data']) : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data != null ? this.data!.toJson() : null;
    return data;
  }

  String toPlain() {
    return 'AuthResponse{ status: $status, message: $message, data: $data }';
  }

  @override
  String toJsonString() {
    return jsonEncode(toJson());
  }
}
