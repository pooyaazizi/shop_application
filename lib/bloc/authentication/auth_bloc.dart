import 'package:bloc/bloc.dart';
import 'package:shop_application/bloc/authentication/auth_event.dart';
import 'package:shop_application/bloc/authentication/auth_state.dart';
import 'package:shop_application/data/repository/authentication_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthenticationRepository _auth;

  AuthBloc(this._auth) : super(AuthInitiate()) {
    on<AuthLoginRequest>((event, emit) async {
      emit(AuthLoadingState());

      final response = await _auth.login(
        event.username,
        event.password,
      );

      emit(AuthResponseState(response));
    });
  }
}
