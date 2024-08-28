import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:pharma/screens/evaluate_ser.dart';
import 'package:pharma/screens/pharmacist_details.dart';
import 'package:url_launcher/url_launcher.dart';

class RealTimeData extends StatelessWidget {
  RealTimeData({super.key});
  final ref = FirebaseDatabase.instance.ref('Users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pharmacists List"),
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
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PHARMACIE: ${snapshot.child('name').value.toString()}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            /*Text(snapshot.child('name').value.toString()),*/
                            // Text(snapshot.child('address').value.toString()),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                  size: 10,
                                ),

                                SizedBox(
                                    width:
                                        5), // Optional: Adjust the spacing between the icon and the text
                                Expanded(
                                  child: Text(
                                    snapshot.child('address').value.toString(),
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            ),
                            //Text(snapshot.child('email').value.toString()),
                            Row(
                              children: [
                                Icon(
                                  Icons.email,
                                  color: Colors.black,
                                  size: 10,
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    snapshot.child('email').value.toString(),
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            ),
                            // Text(snapshot.child('phone').value.toString()),
                            Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: Colors.black,
                                  size: 10,
                                ),
                                SizedBox(
                                    width:
                                        5), // Optional: Adjust the spacing between the icon and the text
                                Text(snapshot.child('phone').value.toString()),
                              ],
                            ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (e) => const RateSer(),
                                  ),
                                );
                              },
                              child: Text('Rate Service'),
                            ),
                          ],
                        ),
                        trailing: ElevatedButton(
                          onPressed: () async {
                            String? encodeQueryParameters(
                                Map<String, String> params) {
                              return params.entries
                                  .map((MapEntry<String, String> e) =>
                                      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                  .join('&');
                            }

                            final Uri emailUri = Uri(
                              scheme: 'mailto',
                              path: 'linagousmi03@gmail.com',
                              query: encodeQueryParameters(<String, String>{
                                'subject': 'Commande d' 'un médicament',
                                'body': 'Entrer votre commande ',
                              }),
                            );
                            /* if (await canLaunchUrl(emailUri)) {
                              launchUrl(
                                emailUri,
                              );
                            } else {
                              throw Exception('could not launch $emailUri');
                            }*/
                            if (await canLaunchUrl(emailUri)) {
                              await launchUrl(emailUri);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('Now you can order your medicine'),
                                ),
                              );
                            } else {
                              throw Exception('Could not launch $emailUri');
                            }
                          },
                          child: Text('send an order'),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ));
  }
}
