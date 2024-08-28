import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppInfos extends StatelessWidget {
  const AppInfos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Informations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          alignment: Alignment.topCenter,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Center(
                child: Text(
                  'Pharmacist service',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Localisation des pharmaciens, Recherche des médicaments\n ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 123, 119, 117),
                ),
              ),
              Text(
                ' et Evaluatiion des services des pharmaciens',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 123, 119, 117),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'Version 1.0',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color.fromARGB(255, 123, 119, 117),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Projet réalisé par :',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromARGB(255, 123, 119, 117),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'LINA GOUSMI ',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 123, 119, 117),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Pour toutes Erreurs ou suggestions veillez contacter:',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromARGB(255, 123, 119, 117),
                ),
              ),
              Text(
                'Pharmacist_service@gmail.com',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromARGB(255, 123, 119, 117),
                ),
              ),
              SizedBox(height: 300),
              Text(
                'projet  licence  USTHB',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
