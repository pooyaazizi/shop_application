import 'package:dartz/dartz.dart';

abstract class AuthState {}

class AuthInitiate extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthResponseState extends AuthState {
  Either<String, String> response;
  AuthResponseState(this.response);
}
