import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:topicos_clinica/src/services/auth.dart';

import '../globals.dart' show Routes;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget homeIcon(String name, IconData iconData, {bool colorGrey = false}) {
    return InkWell(
      onTap: () async {
        await Get.toNamed(Routes.reserve);
      },
      child: Container(
        color: colorGrey ? Colors.grey.shade50 : Colors.grey.shade300,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: Icon(
                iconData,
                size: Get.width / 9 * 1.5,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.shade400,
        title: Text('Bienvenido 🤗'),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await Auth.instance.signOut();
              await Get.offAllNamed(Routes.login);
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverGrid.count(
            crossAxisCount: 2,
            children: [
              homeIcon('Pediatra', Icons.child_care, colorGrey: false),
              homeIcon('General', Icons.local_hospital, colorGrey: true),
              homeIcon('Plástica', Icons.face, colorGrey: true),
              homeIcon('Covid', Icons.healing, colorGrey: false),
              homeIcon('Otro', Icons.grade, colorGrey: false),
            ],
          ),
        ],
      ),
    );
  }
}
