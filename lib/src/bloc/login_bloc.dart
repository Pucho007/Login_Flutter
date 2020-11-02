
import 'dart:async';

import 'package:prueba1/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validator{
  final _emailController= BehaviorSubject<String>();
  final _passwordController=BehaviorSubject<String>();

  //Recuperamos los datos del Stream

  Stream<String> get emailStream => _emailController.stream.transform(validarUser);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream => Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);


  //Insertar valores al Stream

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;


  //Obtener los string
  String get user => _emailController.value;
  String get password => _passwordController.value;

  dispose(){
    _emailController.close();
    _passwordController.close();
  }


}