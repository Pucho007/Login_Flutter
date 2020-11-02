import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba1/src/bloc/login_bloc.dart';
import 'package:prueba1/src/bloc/provider.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          _fondo(context),
          _login(context)
        ],
      )
    );
  }

  Widget _fondo(BuildContext context){
    final _screen=MediaQuery.of(context).size;

    Widget _fondoMorado= Container(
      height: _screen.height*0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 178, 1.0)
          ]
        )
      ),
    ); 

    Widget _circulo = Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.07)
      ),
    );

    Widget _data= Container(
      padding: EdgeInsets.symmetric(vertical: 50.0),
      child:Column(
        children:[
          Icon(Icons.person_pin_circle_outlined,color: Colors.white,size: 100.0,),
          SizedBox(height: 10.0, width: double.infinity,),
          Text('BIENVENIDO',style: TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.bold),)
        ]
      )
    );
 
    return Stack(
      children: [
        _fondoMorado,
        Positioned(child: _circulo,top: 20.0, left: -20.0,),
        Positioned(child: _circulo,top: 5.0, right: -20.0,),
        Positioned(child: _circulo,top:200.0,right: 10.0,),
        Positioned(child: _circulo,top:200.0,left: -10.0,),
        _data
      ],
    );
  }

  Widget _login(BuildContext context){
    final bloc=Provider.of(context);
    final _screen=MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(child: Container(height:180),),
          Container(
            width: _screen.width*0.85,
            padding: EdgeInsets.symmetric(vertical: 40.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0
                )
              ]
            ),
            child: Column(
              children:[
                Text('Ingreso', style: TextStyle(fontSize: 20.0),),
                SizedBox(height: 40,),
                _user(bloc),
                SizedBox(height: 30,),
                _password(bloc),
                SizedBox(height: 30,),
                _bottom(bloc)
              ]
            ),
          ),
          SizedBox(height: 20.0,),
          Text('¿Olvidaste tu Contraseña?'),
          SizedBox(height: 100.0,)
        ],
      ),
    );

  }

  Widget _user(LoginBloc bloc){

    return StreamBuilder(
      stream: bloc.emailStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.email, color: Colors.deepPurple,),
              hintText: 'correo@dominio.com',
              labelText: 'Correo',
              //counterText: snapshot.data,
              errorText: snapshot.error
            ),
            onChanged: (value)=>{bloc.changeEmail(value)},
          ),
        );
      },
    );

    
  }

  Widget _password(LoginBloc bloc){
    return StreamBuilder(
      stream: bloc.passwordStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              icon: Icon(Icons.lock_outline,color: Colors.deepPurple),
              hintText: '***********',
              labelText: 'Contraseña',
              //counterText: snapshot.data,
              errorText: snapshot.error
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
    
  }
  
  Widget _bottom(LoginBloc bloc){
    return StreamBuilder(
      stream: bloc.formValidStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical:15.0),
            child: Text('Ingresar',style: TextStyle(color: Colors.white),),
          ),
          onPressed: snapshot.hasData ? ()=>_obtenerData(bloc, context) : null,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          color: Colors.deepPurple,
        );
      },
    );
    
  }

  _obtenerData(LoginBloc bloc, BuildContext context){
    Navigator.of(context).pushReplacementNamed('home');    
  }

}