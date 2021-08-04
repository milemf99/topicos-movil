import 'package:flutter/material.dart';

Widget renderNombre() {
  return Padding(
    padding: const EdgeInsets.only(top: 40),
    child: TextField(
      decoration: InputDecoration(hintText: 'Nombre(s)'),
    ),
  );
}

Widget renderApellido() {
  return Padding(
    padding: const EdgeInsets.only(top: 40),
    child: TextField(
      decoration: InputDecoration(hintText: 'Apellido(s)'),
    ),
  );
}

Widget renderCorreo() {
  return Padding(
    padding: const EdgeInsets.only(top: 40),
    child: TextField(
      decoration: InputDecoration(hintText: 'Correo Electronico'),
    ),
  );
}

Widget renderPassword() {
  return Padding(
    padding: const EdgeInsets.only(top: 40),
    child: TextField(
      decoration: InputDecoration(hintText: 'Contraseña'),
      obscureText: true,
    ),
  );
}

Widget renderConfirmPassword() {
  return Padding(
    padding: const EdgeInsets.only(top: 40),
    child: TextField(
      decoration: InputDecoration(hintText: 'Confirmar contraseña'),
      obscureText: true,
    ),
  );
}

Widget renderCarnet() {
  return Padding(
    padding: const EdgeInsets.only(top: 40),
    child: TextField(
      decoration: InputDecoration(hintText: 'Carnet de identidad'),
    ),
  );
}

Widget renderDireccion() {
  return Padding(
    padding: const EdgeInsets.only(top: 40),
    child: TextField(
      decoration: InputDecoration(hintText: 'Direccion'),
    ),
  );
}

Widget renderFecha() {
  return Padding(
    padding: const EdgeInsets.only(top: 40),
    child: TextField(
      decoration: InputDecoration(hintText: 'Fecha de nacimiento'),
    ),
  );
}

Widget renderTelf() {
  return Padding(
    padding: const EdgeInsets.only(top: 40),
    child: TextField(
      decoration: InputDecoration(hintText: 'Telefono'),
    ),
  );
}

Widget renderSexo() {
  return Padding(
    padding: const EdgeInsets.only(top: 40),
    child: TextField(
      decoration: InputDecoration(hintText: 'Sexo'),
    ),
  );
}

Widget renderLoginButton() {
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: RaisedButton(
        child: Text('Registrar'),
        textColor: Colors.white,
        onPressed: () {},
        color: Colors.deepPurpleAccent.shade400,
      ),
    );
  }
class RegistrarPaciente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Crear una cuenta'),
          backgroundColor: Colors.deepPurpleAccent.shade400),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(color: Colors.white),
          child: ListView(children: [
            renderNombre(),
            renderApellido(),
            renderCorreo(),
            renderPassword(),
            renderConfirmPassword(),
            renderCarnet(),
            renderDireccion(),
            renderFecha(),
            renderTelf(),
            renderSexo(),
            renderLoginButton()
          ])),
    );
  }
}
