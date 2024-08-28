import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Medplatform extends StatelessWidget {
  Medplatform({super.key});
  final ref = FirebaseDatabase.instance.ref('medcines');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Medcines available"),
        ),
        body: Column(
          children: [
            Expanded(
              child: FirebaseAnimatedList(
                  query: ref,
                  itemBuilder: (context, snapshot, Animation, index) {
                    return Card(
                      color: Colors.teal[100],
                      child: ListTile(
                          title: Text(snapshot.child('email').value.toString()),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.child('medcines').value.toString()),
                            ],
                          )

                          // trailing: Text(snapshot.child('name').value.toString()),
                          ),
                    );
                  }),
            )
          ],
        ));
  }
}
