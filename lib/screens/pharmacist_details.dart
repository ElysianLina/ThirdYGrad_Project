import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:pharma/screens/pharmacist_details.dart';

class PharDetails extends StatelessWidget {
  PharDetails({super.key});
  final ref = FirebaseDatabase.instance.ref('Users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pharmacist Play List"),
        ),
        body: Expanded(
          child: FirebaseAnimatedList(
              query: ref,
              itemBuilder: (context, snapshot, Animation, index) {
                return Card(
                  color: Colors.teal[100],
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(snapshot.child('name').value.toString()),
                        Text(snapshot.child('address').value.toString()),
                        Text(snapshot.child('email').value.toString()),
                        Text(snapshot.child('phone').value.toString()),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    ),

                    // trailing: Text(snapshot.child('name').value.toString()),
                  ),
                );
              }),
        ));
  }
}
