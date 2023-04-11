import 'package:bloc/bloc.dart';
import 'package:sa_cooperation/repositories/login_repository.dart';

import '../../models/user.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginRepository loginRepository;

  AuthenticationBloc(this.loginRepository) : super(AuthenticationUninitialized()) {
    on<AuthenticationEvent>(_mapEventToState);
  }

  @override
  Future<void> _mapEventToState(AuthenticationEvent event, Emitter<AuthenticationState> emit) async {
    if (event is AppStarted) {
      emit(AuthenticationLoading());
      final User? loggedInUser = loginRepository.getLoggedInUser;

      if (loggedInUser != null) {
        await Future.delayed(const Duration(milliseconds: 3000));
        emit(AuthenticationAuthenticated(user: loggedInUser));
      } else {
        emit(AuthenticationUnauthenticated());
      }
    }

    if (event is LoggedInUser) {
      emit(AuthenticationLoading());
      final User? loggedInUser = loginRepository.getLoggedInUser;
      emit(AuthenticationAuthenticated(user: loggedInUser!));
    }

    if (event is LoggedOut) {
      emit(AuthenticationLoading());
      await loginRepository.logoutUser();
      emit(AuthenticationUnauthenticated());
    }
  }
}
