// To parse this JSON data, do
//
//     final paciente = pacienteFromJson(jsonString);

import 'dart:convert';

import 'person.dart';

class Paciente {
  Paciente({
    this.persona,
    this.direccionDomicilio,
    this.fechaNacimiento,
    this.sexo,
    this.codigoSeguro,
    this.tipoSeguro,
  });

  Persona? persona;
  String? direccionDomicilio;
  DateTime? fechaNacimiento;
  String? sexo;
  dynamic codigoSeguro;
  dynamic tipoSeguro;

  factory Paciente.fromRawJson(String str) => Paciente.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Paciente.fromJson(Map<String, dynamic> json) => Paciente(
        persona: Persona.fromJson(json["persona"]),
        direccionDomicilio: json["direccion_domicilio"],
        fechaNacimiento: DateTime.parse(json["fecha_nacimiento"]),
        sexo: json["sexo"],
        codigoSeguro: json["codigo_seguro"],
        tipoSeguro: json["tipo_seguro"],
      );

  Map<String, dynamic> toJson() => {
        "persona": persona?.toJson(),
        "direccion_domicilio": direccionDomicilio,
        "fecha_nacimiento": "${fechaNacimiento!.year.toString().padLeft(4, '0')}-${fechaNacimiento!.month.toString().padLeft(2, '0')}-${fechaNacimiento!.day.toString().padLeft(2, '0')}",
        "sexo": sexo,
        "codigo_seguro": codigoSeguro,
        "tipo_seguro": tipoSeguro,
      };
}
