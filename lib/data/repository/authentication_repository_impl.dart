import 'package:dartz/dartz.dart';
import 'package:shop_application/core/di/locator.dart';
import 'package:shop_application/core/error/api_exception.dart';
import 'package:shop_application/core/utils/auth_manager.dart';
import 'package:shop_application/data/datasource/authentication_datasource.dart';
import 'package:shop_application/data/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl
    implements IAuthenticationRepository {
  final IAuthenticationDatasource _datasource = locator
      .get();

  @override
  Future<Either<String, String>> register(
    String username,
    String password,
    String passwordConfirm,
  ) async {
    try {
      await _datasource.register(
        username,
        password,
        passwordConfirm,
      );
      return right('ثبت نام با موفقیت انجام شد.');
    } on ApiException catch (ex) {
      return left(
        '${ex.message}\n...ثبت نام انجام نشد، مجدداً تلاش فرمایید',
      );
    } catch (ex) {
      return left('خطای نا مشخصی رخ داده است');
    }
  }

  @override
  Future<Either<String, String>> login(
    String username,
    String password,
  ) async {
    try {
      String token = await _datasource.login(
        username,
        password,
      );
      if (token.isNotEmpty) {
        AuthManager.saveToken(token);
        return right('ورود با موفقیت انجام شد');
      } else {
        return left('خطا هنگام ورود پیش آمده است');
      }
    } on ApiException catch (ex) {
      return left('${ex.message}');
    }
  }
}
