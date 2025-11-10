import 'package:dio/dio.dart';
import 'package:shop_application/core/constants/api_constants.dart';
import 'package:shop_application/core/di/locator.dart';
import 'package:shop_application/core/error/api_exception.dart';
import 'package:shop_application/data/datasource/authentication_datasource.dart';

class AuthenticationRemoteDatasourceImpl
    implements IAuthenticationDatasource {
  final Dio _dio = locator.get();

  @override
  Future<void> register(
    String username,
    String password,
    String passwordConfirm,
  ) async {
    try {
      final response = await _dio.post(
        ApiConstants.registerEndpoint,
        data: {
          'username': username,
          'password': password,
          'passwordConfirm': passwordConfirm,
        },
      );

      print('${response.statusCode}');
      print('${response.statusMessage}');
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(0, 'Unknown Error');
    }
  }

  @override
  Future<String> login(
    String username,
    String password,
  ) async {
    try {
      var response = await _dio.post(
        ApiConstants.loginEndpoint,
        data: {
          'identity': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return response.data['token'];
      }
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'] ?? 'Login Failed',
      );
    } catch (ex) {
      throw ApiException(0, 'Unknown Error');
    }
    return '';
  }
}
