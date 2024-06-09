import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';


// Event
abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});
}

// State
abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {}

// Bloc
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialLoginState()){
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }
  Future<void> _onLoginButtonPressed(LoginButtonPressed event,Emitter<LoginState> emit) async{
    emit(LoginLoading());
    if(event.email=="mete.059@hotmail.com" && event.password=="123456789"){
      emit(InitialLoginState());
    }else{
      emit(LoginFailure());
    }
  }


}
