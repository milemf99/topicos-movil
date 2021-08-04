//import 'dart:js';

//import 'package:clinica/registrarpaciente.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  Widget renderEmailInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Usuario o Correo Electronico'),
      ),
    );
  }

  Widget renderPasswordInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Contraseña'),
        obscureText: true,
      ),
    );
  }

  Widget renderLoginButton() {
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: RaisedButton(
        child: Text('Entrar'),
        textColor: Colors.white,
        onPressed: () {},
        color: Colors.deepPurpleAccent.shade400,
      ),
    );
  }

  Widget renderDivisor() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(child: Divider(height: 1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text('0'),
          ),
          Expanded(child: Divider(height: 1))
        ],
      ),
    );
  }

  Widget renderLoginRegister(context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: RaisedButton(
        child: Text('Registrate'),
        textColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, 'register');
        },
        color: Colors.deepPurpleAccent.shade400,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Login'),
          backgroundColor: Colors.deepPurpleAccent.shade400),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(color: Colors.white),
          child: ListView(children: [
            Image.asset(
              'assets/image/imagen1.jpg',
              /*width: 540.0,
        height: 240.0,*/
            ),
            renderEmailInput(),
            renderPasswordInput(),
            renderLoginButton(),
            //renderCreateAccountLink(),
            renderDivisor(),
            renderLoginRegister(context)
          ])),
    );
  }
}
