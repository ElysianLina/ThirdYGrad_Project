import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pharma/widegets/custom_scaffold.dart';

class MedScreen extends StatefulWidget {
  const MedScreen({super.key});

  @override
  State<MedScreen> createState() => _MedScreenState();
}

final medcinesController = TextEditingController();
final pharmacistemailController = TextEditingController();
const roleController = "pharmacist";
final databaseReference = FirebaseDatabase.instance.ref("medcines");

class _MedScreenState extends State<MedScreen> {
  final medcinesController = TextEditingController();
  final pharmacistemailController = TextEditingController();
  final _formSignKey = GlobalKey<FormState>();
  bool rememberPassword = true;
  @override
  void dispose() {
    super.dispose();
    medcinesController.dispose();
    pharmacistemailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        child: Column(children: [
      const Expanded(
        flex: 1,
        child: SizedBox(
          height: 10,
        ),
      ),
      Expanded(
          flex: 7,
          child: Container(
              padding: const EdgeInsets.fromLTRB(20.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70.0),
                  topRight: Radius.circular(70.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formSignKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        ' Medcines added  !',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.teal,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        cursorColor: Colors.teal,
                        controller: pharmacistemailController,
                        //obscureText: true,
                        //obscuringCharacter: 'r',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ' Enter your email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text(' Pharmacist email'),
                          hintText: 'Enter email',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        cursorColor: Colors.teal,
                        controller: medcinesController,
                        //obscureText: true,
                        //obscuringCharacter: 'r',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ' Add a medcine';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text(' Medcine Name'),
                          hintText: 'Add  Medcine',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // when we have click the add button this items are added in database
                            databaseReference
                                .child(DateTime.now().microsecond.toString())
                                .set({
                              'email':
                                  pharmacistemailController.text.toString(),
                              'medcines': medcinesController.text.toString(),
                              'role': roleController,
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.teal),
                          ),
                          child: const Text(
                            'Add',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )))
    ]));
  }
}
