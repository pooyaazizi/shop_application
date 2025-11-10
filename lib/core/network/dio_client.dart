import 'package:dio/dio.dart';
import 'package:shop_application/core/constants/api_constants.dart';

class DioClient {
  static Dio? _instance;
  static Dio get instance {
    _instance ??= _createDio();
    return _instance!;
  }

  static Dio _createDio() {
    return Dio(
      BaseOptions(baseUrl: ApiConstants.baseUrl),
    );
  }
}
