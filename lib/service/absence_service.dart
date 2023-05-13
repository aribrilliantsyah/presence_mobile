import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:presence_alpha/constant/api_constant.dart';
import 'package:http/http.dart' as http;
import 'package:presence_alpha/payload/response/absence/cancel_response.dart';
import 'package:presence_alpha/payload/response/absence/detail_response.dart';
import 'package:presence_alpha/payload/response/absence/list_response.dart';
import 'package:presence_alpha/payload/response/absence/list_submission.dart';
import 'package:presence_alpha/payload/response/absence/submission_response.dart';

class AbsenceService {
  Future<ListResponse> list(
      Map<String, dynamic> queryParams, String token) async {
    print('GET: absence - list');

    String target = '${ApiConstant.baseApi}/absence';
    final queryParameters = Uri(queryParameters: queryParams).queryParameters;

    final queryString = Uri(queryParameters: queryParameters).query;

    print('target: ${Uri.parse("$target?$queryString")}');

    try {
      final response = await http.get(
        Uri.parse("$target?$queryString"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      ).timeout(Duration(seconds: ApiConstant.timeout));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return ListResponse.fromJson(responseData);
      } else {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return ListResponse(
          status: false,
          message: responseData['message'] ?? 'Unable to fetch data',
        );
      }
    } on TimeoutException catch (e) {
      return ListResponse(
        status: false,
        message: 'Connection timed out',
      );
    } on SocketException catch (e) {
      return ListResponse(
        status: false,
        message: e.message,
      );
    } on Exception catch (e) {
      return ListResponse(
        status: false,
        message: 'Failed to connect to server',
      );
    } catch (e) {
      return ListResponse(
        status: false,
        message: e.toString(),
      );
    }
  }

  Future<SubmissionResponse> submission(
      Map<String, dynamic> requestData, String token) async {
    print('POST: submission');

    String target = '${ApiConstant.baseApi}/absence/submission';
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
        return SubmissionResponse.fromJson(responseData);
      } else {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return SubmissionResponse(
          status: false,
          message: responseData['message'] ?? 'Unable to fetch data',
        );
      }
    } on TimeoutException catch (e) {
      return SubmissionResponse(
        status: false,
        message: 'Connection timed out',
      );
    } on SocketException catch (e) {
      return SubmissionResponse(
        status: false,
        message: e.message,
      );
    } on Exception catch (e) {
      return SubmissionResponse(
        status: false,
        message: 'Failed to connect to server',
      );
    } catch (e) {
      return SubmissionResponse(
        status: false,
        message: e.toString(),
      );
    }
  }

  Future<DetailResponse> detail(String id, String token) async {
    print('GET: absence - detail');

    String target = '${ApiConstant.baseApi}/absence/$id';
    print('target: ${Uri.parse(target)}');

    try {
      final response = await http.get(
        Uri.parse(target),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      ).timeout(Duration(seconds: ApiConstant.timeout));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return DetailResponse.fromJson(responseData);
      } else {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return DetailResponse(
          status: false,
          message: responseData['message'] ?? 'Unable to fetch data',
        );
      }
    } on TimeoutException catch (e) {
      return DetailResponse(
        status: false,
        message: 'Connection timed out',
      );
    } on SocketException catch (e) {
      return DetailResponse(
        status: false,
        message: e.message,
      );
    } on Exception catch (e) {
      return DetailResponse(
        status: false,
        message: 'Failed to connect to server',
      );
    } catch (e) {
      return DetailResponse(
        status: false,
        message: e.toString(),
      );
    }
  }

  Future<ListSubmissionResponse> listSubmission(String id, String token) async {
    print('GET: absence - list_submission');

    String target = '${ApiConstant.baseApi}/absence/submission/$id';
    print('target: ${Uri.parse(target)}');

    try {
      final response = await http.get(
        Uri.parse(target),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      ).timeout(Duration(seconds: ApiConstant.timeout));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return ListSubmissionResponse.fromJson(responseData);
      } else {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return ListSubmissionResponse(
          status: false,
          message: responseData['message'] ?? 'Unable to fetch data',
        );
      }
    } on TimeoutException catch (e) {
      return ListSubmissionResponse(
        status: false,
        message: 'Connection timed out',
      );
    } on SocketException catch (e) {
      return ListSubmissionResponse(
        status: false,
        message: e.message,
      );
    } on Exception catch (e) {
      return ListSubmissionResponse(
        status: false,
        message: 'Failed to connect to server',
      );
    } catch (e) {
      return ListSubmissionResponse(
        status: false,
        message: e.toString(),
      );
    }
  }

  Future<CancelResponse> cancel(
      Map<String, dynamic> requestData, String token) async {
    print('POST: cancel');

    String target = '${ApiConstant.baseApi}/absence/cancel';
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
        return CancelResponse.fromJson(responseData);
      } else {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return CancelResponse(
          status: false,
          message: responseData['message'] ?? 'Unable to fetch data',
        );
      }
    } on TimeoutException catch (e) {
      return CancelResponse(
        status: false,
        message: 'Connection timed out',
      );
    } on SocketException catch (e) {
      return CancelResponse(
        status: false,
        message: e.message,
      );
    } on Exception catch (e) {
      return CancelResponse(
        status: false,
        message: 'Failed to connect to server',
      );
    } catch (e) {
      return CancelResponse(
        status: false,
        message: e.toString(),
      );
    }
  }
}
