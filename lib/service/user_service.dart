import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:presence_alpha/constant/api_constant.dart';
import 'package:http/http.dart' as http;
import 'package:presence_alpha/payload/response/dashboard1_response.dart';
import 'package:presence_alpha/payload/response/today_check_response.dart';

class UserService {
  Future<Dashboard1Response> dashboard1(
      Map<String, dynamic> requestData, String token) async {
    print('POST: dashboard1');

    String target = '${ApiConstant.baseApi}/user/dashboard1';
    print('target: $target');
    print('json" ${jsonEncode(json.encode(requestData))}');

    try {
      final response = await http
          .post(
            Uri.parse(target),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token'
            },
            body: json.encode(requestData),
          )
          .timeout(Duration(seconds: ApiConstant.timeout));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return Dashboard1Response.fromJson(responseData);
      } else {
        return Dashboard1Response(
          status: false,
          message: 'Unable to fetch data',
          data: null,
        );
      }
    } on TimeoutException catch (e) {
      return Dashboard1Response(
        status: false,
        message: 'Connection timed out',
        data: null,
      );
    } on SocketException catch (e) {
      return Dashboard1Response(
        status: false,
        message: e.message,
        data: null,
      );
    } on Exception catch (e) {
      return Dashboard1Response(
        status: false,
        message: 'Failed to connect to server',
        data: null,
      );
    } catch (e) {
      return Dashboard1Response(
        status: false,
        message: e.toString(),
        data: null,
      );
    }
  }

  Future<TodayCheckResponse> todayCheck(
      Map<String, dynamic> requestData, String token) async {
    print('POST: today_check');

    String target = '${ApiConstant.baseApi}/user/today_check';
    print('target: $target');
    print('json" ${jsonEncode(json.encode(requestData))}');

    try {
      final response = await http
          .post(
            Uri.parse(target),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token'
            },
            body: json.encode(requestData),
          )
          .timeout(Duration(seconds: ApiConstant.timeout));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return TodayCheckResponse.fromJson(responseData);
      } else {
        return TodayCheckResponse(
          status: false,
          message: 'Unable to fetch data',
          data: null,
        );
      }
    } on TimeoutException catch (e) {
      return TodayCheckResponse(
        status: false,
        message: 'Connection timed out',
        data: null,
      );
    } on SocketException catch (e) {
      return TodayCheckResponse(
        status: false,
        message: e.message,
        data: null,
      );
    } on Exception catch (e) {
      return TodayCheckResponse(
        status: false,
        message: 'Failed to connect to server',
        data: null,
      );
    } catch (e) {
      return TodayCheckResponse(
        status: false,
        message: e.toString(),
        data: null,
      );
    }
  }
}
