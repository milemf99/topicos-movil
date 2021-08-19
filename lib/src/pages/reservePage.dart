import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topicos_clinica/src/globals.dart';

const doctors = [
  'Dr Chayanne',
  'Dr Oliva',
  'Dr Choque',
];

class ReservePage extends StatefulWidget {
  ReservePage({Key? key}) : super(key: key);

  @override
  _ReservePageState createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {
  final _formKey = GlobalKey<FormState>();
  bool face2face = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solicitar Reserva'),
        backgroundColor: Colors.purple.shade400,
        actions: [
          Icon(Icons.notifications),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CircleAvatar(
                  radius: 100,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: 'https://cdn.discordapp.com/attachments/848759567273164800/878008929634910228/chayanne.jpg',
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text('Dr Jose Jose Chayane'),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text('Especialidad: Urología'),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text('Tarifa estandar: 250 bs.'),
              ),
            ],
          ),

          // select doctor
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DropdownButton<String>(
              icon: Icon(Icons.person),
              hint: Text('Seleccione un doctor'),
              value: doctors.first,
              items: doctors.map((doctor) {
                return DropdownMenuItem<String>(
                  value: doctor,
                  child: Text(doctor),
                );
              }).toList(),
              onChanged: (_doctor) {
                print(_doctor);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              onTap: () async {
                await Get.toNamed(Routes.calendarReserve);
              },
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.calendar_today),
                hintText: 'DD/MM/AAAA*',
                labelText: 'Fecha requerida',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Comentarios adicionales para la cita',
              ),
            ),
          ),
          Row(
            children: [
              Text('Marcar la casilla sid esea que la cita sea presencial'),
              Checkbox(
                value: face2face,
                onChanged: (val) {
                  setState(() => face2face = !face2face);
                },
              ),
            ],
          ),

          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: MaterialButton(
                color: Colors.purple.shade300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(
                      'AGENDAR CITA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
