import 'package:http/http.dart' show post;

import 'package:topicos_clinica/src/models/Token.dart';
import 'package:topicos_clinica/src/models/paciente.dart';
import 'package:topicos_clinica/src/models/person.dart';

import '../globals.dart' show API_URL, box;

class Auth {
  static final _instance = Auth();
  static Auth get instance => _instance;

  // Persona? _user;
  Token? _token;
  Token? get token => _token;
  // Persona? get user => _user;

  Auth() {
    final rawToken = box.read<String>('token');

    if (rawToken != null) {
      this._token = Token.fromRawJson(rawToken);
    }
  }

  void signUp(Paciente paciente) {
    post(
      Uri.parse('$API_URL/pacientes/'),
      headers: {'Content-type': 'application/json'},
      body: paciente.toRawJson(),
    ).then((res) async {
      if (res.statusCode == 200) {
        this._token = Token.fromRawJson(res.body);
        await box.write('token', _token!.toRawJson());
      }
    }).catchError((err) => err);
  }

  Future<bool> signIn(Usuario? usuario) async {
    try {
      final res = await post(
        Uri.parse('$API_URL/iniciar-sesion/'),
        headers: {'Content-Type': 'application/json'},
        body: usuario!.toRawJson(),
      );

      if (res.statusCode == 200) {
        this._token = Token.fromRawJson(res.body);
        await box.write('token', this._token!.toRawJson());

        return true;
      }
    } catch (e) {
      print(e);
    }

    return false;
}

  Future<void> signOut() async {
    await box.remove('token');
  }
}
