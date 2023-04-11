import '../../models/user.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {}

class LoginCreated extends LoginState {
  final String message;
  LoginCreated(this.message);
}

class LoginSuccess extends LoginState {
  final User user;
  LoginSuccess(this.user);
}

class LoginError extends LoginState {
  final String response;
  LoginError(this.response);
}



class UserRefreshed extends LoginState {
  final User user;
  UserRefreshed(this.user);
}
