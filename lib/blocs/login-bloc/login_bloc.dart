import 'package:bloc/bloc.dart';
import 'package:sa_cooperation/blocs/login-bloc/login.dart';
import 'package:sa_cooperation/repositories/login_repository.dart';

import '../../models/user.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;

  LoginBloc(this.repository) : super(LoginInitial()) {
    on<LoginEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is Login) {
      try {
        User user = await repository.createLogin(event.requestBody);
        emit(LoginSuccess(user));
      } catch (e) {
        emit(LoginError(e.toString()));
      }
    }

  }
}
