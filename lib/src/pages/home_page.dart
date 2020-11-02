import 'package:flutter/material.dart';
import 'package:prueba1/src/bloc/provider.dart';

class HomePage extends StatelessWidget{
  
  int conteo=0;

  @override
  Widget build(BuildContext context) {
    final bloc=Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME PAGE"),
        centerTitle: false,
        elevation: 10.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Text('email: ${bloc.user}'),
          Divider(),
          Text('password: ${bloc.password}')
        ]
      ),
    );
  }
}