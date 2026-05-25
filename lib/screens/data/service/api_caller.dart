import 'dart:convert';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:task_manager_by_ostad/controller/auth_controller.dart';
import 'package:task_manager_by_ostad/screens/data/model/api_response.dart';

class ApiCaller {
  static final Logger _logger = Logger();

  //<-------------Get Request----------------->

  static Future<ApiResponse> getRequest({required String URL}) async {
    Uri uri = Uri.parse(URL);
    _logger.i(URL);

    Response response = await get(
      uri,
      headers: {'token': AuthController.accessToken ?? ''},
    );

    _logger.i(response.statusCode);
    _logger.i(response.body);

    if (response.statusCode == 200) {
      return ApiResponse(
        responseCode: response.statusCode,
        responseData: jsonDecode(response.body),
        isSuccess: true,
      );
    } else {
      return ApiResponse(
        responseCode: response.statusCode,
        responseData: jsonDecode(response.body),
        errorMessage: jsonDecode(response.body),
        isSuccess: false,
      );
    }
  }

  //<-------------Post Request----------------->

  static Future<ApiResponse> postRequest({
    required String URL,
    Map<String, dynamic>? body,
  }) async {
    Uri uri = Uri.parse(URL);
    _logger.i(URL);

    Response response = await post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'token': AuthController.accessToken ?? '',
      },

      body: body != null ? jsonEncode(body) : null,
    );

    _logger.i(response.statusCode);
    _logger.i(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ApiResponse(
        responseCode: response.statusCode,
        responseData: jsonDecode(response.body),
        isSuccess: true,
      );
    } else {
      return ApiResponse(
        responseCode: response.statusCode,
        responseData: jsonDecode(response.body),
        errorMessage: jsonDecode(response.body),
        isSuccess: false,
      );
    }
  }
}
