//LOGICA DEL APP
import 'package:flutter/material.dart';

import 'package:prueba1/src/pages/home_page.dart';
import 'package:prueba1/src/pages/login_page.dart';

import 'bloc/provider.dart';

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: {
          'login':(BuildContext context) => LoginPage(),
          'home':(BuildContext context) => HomePage()
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple
        ),
      ),
    );
  }
}