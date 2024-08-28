import 'package:flutter/material.dart';
import 'package:pharma/widegets/custom_scaffold.dart';

class SucceRegister extends StatefulWidget {
  const SucceRegister({super.key});

  @override
  State<SucceRegister> createState() => _SucceRegisterState();
}

class _SucceRegisterState extends State<SucceRegister> {
  final _formSignKey = GlobalKey<FormState>();
  bool rememberPassword = true;

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
                        ' You are Succesfully registred  !',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.teal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              )))
    ]));
  }
}
