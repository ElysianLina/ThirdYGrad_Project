import 'package:flutter/material.dart';
import 'package:pharma/constants/my_colors.dart';
import 'package:pharma/screens/appInfos.dart';
import 'package:pharma/screens/dutyPharmacist_list.dart';
import 'package:pharma/screens/medcines_platform.dart';
import 'package:pharma/screens/pages/myprofile.dart';

import 'package:pharma/screens/pharmacist_history.dart';
import 'package:pharma/screens/signup_pharmacist.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);

  Widget buildDrawerHeader(context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsetsDirectional.fromSTEB(70, 10, 70, 10),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.blue[100],
          ),
          child: Image.asset(
            'assets/images/user.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget buildDrawerListItem(
      {required IconData leadingIcon,
      required String title,
      Widget? trailing,
      Function()? onTap,
      Color? color}) {
    return ListTile(
      leading: Icon(
        leadingIcon,
        color: color ?? MyColors.blue,
      ),
      title: Text(title),
      trailing: trailing ??= Icon(
        Icons.arrow_right,
        color: MyColors.blue,
      ),
      onTap: onTap,
    );
  }

  Widget buildDrawerListItemsDivider() {
    return Divider(
      height: 0,
      thickness: 1,
      indent: 18,
      endIndent: 24,
    );
  }

  void _launchURL(String url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  Widget buildIcon(IconData icon, String url) {
    return InkWell(
      onTap: () => _launchURL(url),
      child: Icon(
        icon,
        color: MyColors.blue,
        size: 35,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 280,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue[100]),
              child: buildDrawerHeader(context),
            ),
          ),
          buildDrawerListItem(
            leadingIcon: Icons.person,
            title: 'My Profile',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (e) => const ProfilePage(),
                ),
              );
            },
          ),
          buildDrawerListItemsDivider(),
          buildDrawerListItem(
            leadingIcon: Icons.history,
            title: 'Pharmacist List',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (e) => RealTimeData(),
                ),
              );
            },
          ),
          buildDrawerListItemsDivider(),
          /* buildDrawerListItem(
              leadingIcon: Icons.settings, title: 'App Informations'),
          buildDrawerListItemsDivider(),*/
          buildDrawerListItem(
            leadingIcon: Icons.help,
            title: 'Pharmacist registration',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (e) => const SignUpPharmacist(),
                ),
              );
            },
          ),
          buildDrawerListItemsDivider(),
          buildDrawerListItem(
            leadingIcon: Icons.help,
            title: 'Duty Pharmacist List',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (e) => DutyPharmacist(),
                ),
              );
            },
          ),
          buildDrawerListItemsDivider(),
          buildDrawerListItem(
            leadingIcon: Icons.help,
            title: 'App Informations',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (e) => const AppInfos(),
                ),
              );
            },
          ),
          buildDrawerListItemsDivider(),
          const SizedBox(
            height: 180,
          ),
          /* ListTile(
            leading: Text(
              'Follow us',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),*/
        ],
      ),
    );
  }
}
