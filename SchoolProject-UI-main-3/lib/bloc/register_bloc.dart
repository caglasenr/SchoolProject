import 'package:flutter_bloc/flutter_bloc.dart';

enum RegisterEvent { registerButtonPressed }

class RegisterBloc extends Bloc<RegisterEvent, dynamic> {
  RegisterBloc() : super(null);

  Stream mapEventToState(RegisterEvent event) async* {
    if (event == RegisterEvent.registerButtonPressed) {
      // Kayıt işlemleri burada gerçekleştirilecek
    }
  }
}