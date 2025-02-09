import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:monasebty/core/model/response/request_response.dart';
import 'package:monasebty/core/services/local_storage_services.dart';

class ApiServices {
  
  Future<Dio> launchDio() async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

    dio.options.followRedirects = false;
    dio.options.validateStatus = (status) => status != null && status < 500;

    dio.options.headers['accept'] = 'application/json';
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['X-CSRFTOKEN'] =
        'PodawXu4kdcWa5fdK8yRmvJAdU3so2BRjqALujBTVWDjtHJepC9clxSRIfS03qO7';

    // Get the access token from local storage and add to headers
    final accessToken = await LocalStorageService().accessToken;
    if (accessToken != null) {
      dio.options.headers['Authorization'] = 'Bearer $accessToken';
    }

    return dio;
  }

  Future<RequestResponse> get(
      {required String url, Map<String, dynamic>? params}) async {
    try {
      Dio dio = await launchDio();
      final response = await dio.get(url, queryParameters: params);

      if (response.statusCode == 200) {
        return RequestResponse(true, error: null, data: response.data);
      } else {
        return _handleError(response);
      }
    } catch (e) {
      print('Error in GET request: $e');
      return RequestResponse(false,
          error: "An unexpected error occurred.", data: null);
    }
  }

  Future<RequestResponse> post(
      {required String url, dynamic data, Map<String, dynamic>? params}) async {
    try {
      print("here 1 $url");
      Dio dio = await launchDio();
      print("hee2 $data");
      final response = await dio.post(
        url,
        data: json.encode(data),
      );
      print("@Api Services  data=> ${response.data}");
      print("@Api Services statusCode=> ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return RequestResponse(true, error: null, data: response.data);
      } else {
        return _handleError(response);
      }
    } catch (e) {
      print('Error in POST request: $e');
      return RequestResponse(false,
          error: "An unexpected error occurred.", data: null);
    }
  }

  Future<RequestResponse> put({required String url, dynamic data}) async {
    try {
      Dio dio = await launchDio();
      final response = await dio.put(url, data: data);

      if (response.statusCode == 200) {
        return RequestResponse(true, error: null, data: response.data);
      } else {
        return _handleError(response);
      }
    } catch (e) {
      print('Error in PUT request: $e');
      return RequestResponse(false,
          error: "An unexpected error occurred.", data: null);
    }
  }

  Future<RequestResponse> delete(
      {required String url, Map<String, dynamic>? params}) async {
    try {
      Dio dio = await launchDio();
      final response = await dio.delete(url, queryParameters: params);

      if (response.statusCode == 200) {
        return RequestResponse(true, error: null, data: response.data);
      } else {
        return _handleError(response);
      }
    } catch (e) {
      print('Error in DELETE request: $e');
      return RequestResponse(false, error: 'Invalidate Token', data: null);
    }
  }

  RequestResponse _handleError(Response? response) {
    if (response == null) {

      return RequestResponse(false,
          error: 'No response from server', data: null);
    }
    switch (response.statusCode) {
      case 500:
        return RequestResponse(false, error: 'Server Error', data: null);
      case 401:
        return RequestResponse(false, error: 'Unauthorized', data: null);
      default:
        return RequestResponse(false,
            error: response.data!=null&&response.data.isNotEmpty? response.data['error']:  'Network Error', data: null);
    }
  }
}
