import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:presence_alpha/constant/api_constant.dart';
import 'package:http/http.dart' as http;
import 'package:presence_alpha/payload/response/presence/detail_response.dart';
import 'package:presence_alpha/payload/response/presence/list_response.dart';
import 'package:presence_alpha/payload/response/presence_response.dart';

class PresenceService {
  Future<ListResponse> list(
      Map<String, dynamic> queryParams, String token) async {
    print('GET: presence - list');

    String target = '${ApiConstant.baseApi}/presence';
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

  Future<DetailResponse> detail(String id, String token) async {
    print('GET: presence - detail');

    String target = '${ApiConstant.baseApi}/presence/$id';
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

  Future<PresenceResponse> checkIn(
      Map<String, dynamic> requestData, String token) async {
    print('POST: checkIn');

    String target = '${ApiConstant.baseApi}/presence/check_in';
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
        return PresenceResponse.fromJson(responseData);
      } else {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return PresenceResponse(
          status: false,
          message: responseData['message'] ?? 'Unable to fetch data',
        );
      }
    } on TimeoutException catch (e) {
      return PresenceResponse(
        status: false,
        message: 'Connection timed out',
      );
    } on SocketException catch (e) {
      return PresenceResponse(
        status: false,
        message: e.message,
      );
    } on Exception catch (e) {
      return PresenceResponse(
        status: false,
        message: 'Failed to connect to server',
      );
    } catch (e) {
      return PresenceResponse(
        status: false,
        message: e.toString(),
      );
    }
  }

  Future<PresenceResponse> checkOut(
      Map<String, dynamic> requestData, String token) async {
    print('POST: checkIn');

    String target = '${ApiConstant.baseApi}/presence/check_out';
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
        return PresenceResponse.fromJson(responseData);
      } else {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return PresenceResponse(
          status: false,
          message: responseData['message'] ?? 'Unable to fetch data',
        );
      }
    } on TimeoutException catch (e) {
      return PresenceResponse(
        status: false,
        message: 'Connection timed out',
      );
    } on SocketException catch (e) {
      return PresenceResponse(
        status: false,
        message: e.message,
      );
    } on Exception catch (e) {
      return PresenceResponse(
        status: false,
        message: 'Failed to connect to server',
      );
    } catch (e) {
      return PresenceResponse(
        status: false,
        message: e.toString(),
      );
    }
  }

  Future<PresenceResponse> startOvertime(
      Map<String, dynamic> requestData, String token) async {
    print('POST: start_overtime');

    String target = '${ApiConstant.baseApi}/presence/start_overtime';
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
        return PresenceResponse.fromJson(responseData);
      } else {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return PresenceResponse(
          status: false,
          message: responseData['message'] ?? 'Unable to fetch data',
        );
      }
    } on TimeoutException catch (e) {
      return PresenceResponse(
        status: false,
        message: 'Connection timed out',
      );
    } on SocketException catch (e) {
      return PresenceResponse(
        status: false,
        message: e.message,
      );
    } on Exception catch (e) {
      return PresenceResponse(
        status: false,
        message: 'Failed to connect to server',
      );
    } catch (e) {
      return PresenceResponse(
        status: false,
        message: e.toString(),
      );
    }
  }

  Future<PresenceResponse> endOvertime(
      Map<String, dynamic> requestData, String token) async {
    print('POST: end_overtime');

    String target = '${ApiConstant.baseApi}/presence/end_overtime';
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
        return PresenceResponse.fromJson(responseData);
      } else {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return PresenceResponse(
          status: false,
          message: responseData['message'] ?? 'Unable to fetch data',
        );
      }
    } on TimeoutException catch (e) {
      return PresenceResponse(
        status: false,
        message: 'Connection timed out',
      );
    } on SocketException catch (e) {
      return PresenceResponse(
        status: false,
        message: e.message,
      );
    } on Exception catch (e) {
      return PresenceResponse(
        status: false,
        message: 'Failed to connect to server',
      );
    } catch (e) {
      return PresenceResponse(
        status: false,
        message: e.toString(),
      );
    }
  }

  Future<PresenceResponse> startHolidayOvertime(
      Map<String, dynamic> requestData, String token) async {
    print('POST: start_holiday_overtime');

    String target = '${ApiConstant.baseApi}/presence/start_holiday_overtime';
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
        return PresenceResponse.fromJson(responseData);
      } else {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return PresenceResponse(
          status: false,
          message: responseData['message'] ?? 'Unable to fetch data',
        );
      }
    } on TimeoutException catch (e) {
      return PresenceResponse(
        status: false,
        message: 'Connection timed out',
      );
    } on SocketException catch (e) {
      return PresenceResponse(
        status: false,
        message: e.message,
      );
    } on Exception catch (e) {
      return PresenceResponse(
        status: false,
        message: 'Failed to connect to server',
      );
    } catch (e) {
      return PresenceResponse(
        status: false,
        message: e.toString(),
      );
    }
  }

  Future<PresenceResponse> endHolidayOvertime(
      Map<String, dynamic> requestData, String token) async {
    print('POST: end_holiday_overtime');

    String target = '${ApiConstant.baseApi}/presence/end_holiday_overtime';
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
        return PresenceResponse.fromJson(responseData);
      } else {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return PresenceResponse(
          status: false,
          message: responseData['message'] ?? 'Unable to fetch data',
        );
      }
    } on TimeoutException catch (e) {
      return PresenceResponse(
        status: false,
        message: 'Connection timed out',
      );
    } on SocketException catch (e) {
      return PresenceResponse(
        status: false,
        message: e.message,
      );
    } on Exception catch (e) {
      return PresenceResponse(
        status: false,
        message: 'Failed to connect to server',
      );
    } catch (e) {
      return PresenceResponse(
        status: false,
        message: e.toString(),
      );
    }
  }
}
