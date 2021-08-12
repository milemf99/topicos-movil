import 'package:flutter/material.dart';
import 'package:topicos_clinica/src/models/paciente.dart';
import 'package:topicos_clinica/src/models/person.dart';
import 'package:topicos_clinica/src/services/auth.dart';

import '../globals.dart';
import 'package:get/route_manager.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  Paciente paciente = Paciente(persona: Persona(usuario: Usuario()));
  String? repeatPassword;

  Widget renderNombre() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Nombre(s)'),
        onChanged: (name) => paciente.persona!.nombres = name,
        validator: (name) => name!.isEmpty ? 'Nombre Requerido' : null,
      ),
    );
  }

  Widget renderApellido() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Apellido(s)'),
        onChanged: (apellidos) => paciente.persona!.apellidos = apellidos,
        validator: (apellidos) => apellidos!.isEmpty ? 'Apellidos Requeridos' : null,
      ),
    );
  }

  Widget renderCorreo() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Correo Electronico'),
        onChanged: (email) => paciente.persona!.usuario!.correoElectronico = email,
        validator: (email) => email!.isEmpty ? 'Correo Requerido' : null,
      ),
    );
  }

  Widget renderPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Contraseña'),
        obscureText: true,
        onChanged: (pwd) => paciente.persona!.usuario!.password = pwd,
        validator: (pwd) => pwd!.isEmpty ? 'Contraseña Requerida' : null,
      ),
    );
  }

  Widget renderConfirmPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Confirmar contraseña'),
        obscureText: true,
        onChanged: (pwd) => this.repeatPassword = pwd,
        validator: (pwd) => pwd != this.paciente.persona!.usuario!.password ? 'Confirmar Contraseña' : null,
      ),
    );
  }

  Widget renderCarnet() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Carnet de identidad'),
        onChanged: (ci) => this.paciente.persona!.ci = int.tryParse(ci),
        validator: (ci) => ci!.isEmpty ? 'Número Requerido' : null,
      ),
    );
  }

  Widget renderDireccion() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Direccion'),
        onChanged: (address) => this.paciente.direccionDomicilio = address,
        validator: (address) => address!.isEmpty ? 'Dirección Requerida' : null,
      ),
    );
  }

  Widget renderFecha() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Fecha de nacimiento'),
        onChanged: (birthdate) => this.paciente.fechaNacimiento = DateTime.tryParse(birthdate),
        validator: (birthdate) => DateTime.tryParse(birthdate!) == null ? 'Fecha Requerida' : null,
      ),
    );
  }

  Widget renderTelf() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Telefono'),
        onChanged: (phone) => this.paciente.persona!.telefono = int.tryParse(phone),
        validator: (phone) => int.tryParse(phone!) == null ? 'Teléfono Requerido' : null,
      ),
    );
  }

  Widget renderSexo() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Sexo'),
        onChanged: (gender) {
          this.paciente.sexo = gender;
        },
        validator: (gender) => 'MFmf'.contains(gender!) && gender.length < 2 ? null : 'Género Requerido (M/F)',
      ),
    );
  }

  Widget renderLoginButton() {
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: RaisedButton(
        child: Text('Registrar'),
        textColor: Colors.white,
        onPressed: () {
          if (this._formKey.currentState!.validate()) {
            Auth.instance.signUp(this.paciente);
            Get.toNamed(Routes.home);
          }
        },
        color: Colors.deepPurpleAccent.shade400,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear una cuenta'),
        backgroundColor: Colors.deepPurpleAccent.shade400,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(color: Colors.white),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Image.asset('assets/imagen2.jpg'),
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
              renderLoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}
