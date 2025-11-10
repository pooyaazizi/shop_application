import 'package:bloc/bloc.dart';
import 'package:shop_application/bloc/authentication/auth_event.dart';
import 'package:shop_application/bloc/authentication/auth_state.dart';
import 'package:shop_application/core/di/locator.dart';
import 'package:shop_application/data/repository/authentication_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthenticationRepository auth = locator.get();
  AuthBloc() : super(AuthInitiate()) {
    on<AuthLoginRequest>((event, emit) async {
      emit(AuthLoadingState());

      final response = await auth.login(
        event.username,
        event.password,
      );

      emit(AuthResponseState(response));
    });
  }
}
