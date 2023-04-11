class LoginEvent { }


class Login extends LoginEvent {
  final Map<String, dynamic> requestBody;
  Login(this.requestBody);
}

class RefreshUser extends LoginEvent {}

