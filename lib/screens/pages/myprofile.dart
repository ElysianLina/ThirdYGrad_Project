import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharma/screens/pages/mydetails.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //user
  final currentUser = FirebaseAuth.instance.currentUser!;
  final usercollection = FirebaseFirestore.instance.collection('user');
  //edit field
  Future<void> editfield(String field) async {
    String newValue = "";
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.grey[900],
              title: Text(
                "Edit $field",
                style: TextStyle(color: Colors.white),
              ),
              content: TextField(
                autofocus: true,
                style: const TextStyle(
                    color: Colors.white), // Set the input text color to white
                decoration: InputDecoration(
                    hintText: "Enter new $field",
                    hintStyle: TextStyle(color: Colors.grey)),
                onChanged: (value) {
                  newValue = value;
                },
              ),
              actions: [
                //canel button
                TextButton(
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                //save button
                TextButton(
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => Navigator.of(context).pop(newValue),
                ),
              ],
            ));

    if (newValue.trim().isNotEmpty) {
      await usercollection.doc(currentUser.email).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    final collRef = FirebaseFirestore.instance.collection('user');

    return FutureBuilder<QuerySnapshot>(
        future: collRef
            .where('username', isEqualTo: currentUser.email!.split('@')[0])
            .limit(1)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            final userData =
                snapshot.data!.docs[0].data() as Map<String, dynamic>;
            final username = userData['username'] as String?;
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: Text("My Profile "),
                backgroundColor: Colors.teal,
              ),
              body: ListView(
                children: [
                  const SizedBox(height: 50),

                  //POFILE PICTURE
                  const Icon(
                    Icons.person,
                    size: 72,
                  ),
                  const SizedBox(height: 10),
                  // USER EMAIL
                  Text(
                    currentUser.email!,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  // USER details
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      'My Details',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  //usernamr
                  MyTextBox(
                    text: username!,
                    sectionName: 'username',
                    onPressed: () => editfield('username'),
                  ),
                  //bio
                  MyTextBox(
                    text: 'USTHB  University  Student',
                    sectionName: 'bio',
                    onPressed: () => editfield('bio'),
                  ),
                ],
              ),
            );
          }
          // User data not found
          return Scaffold(
            appBar: AppBar(
              title: Text("My Profile"),
              backgroundColor: Colors.teal,
            ),
            body: Center(
              child: Text('User data not found'),
            ),
          );
        });
  }
}
