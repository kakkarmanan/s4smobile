import 'package:flutter/material.dart';
//import 'package:mobial/widgets/check_list.dart';
//import 'package:mobial/pages/page/profile_page.dart';
//import 'package:mobial/login9/ui/login_page.dart';
//import 'package:mobial/widgets/privacy_policy.dart';
import 'package:localstorage/localstorage.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:mobial/widgets/settings.dart';
import 'package:s4smobile/find_doctor.dart';
import 'package:s4smobile/login1/welcome.dart';
import 'package:s4smobile/profile.dart';
import 'package:s4smobile/widgets/privacy_policy.dart';

Widget drawer(BuildContext context) {
  final LocalStorage storage = new LocalStorage('s4s');
  return Drawer(
    backgroundColor: Color(0xff243D25),
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/img/headerbg.jpg'),
            ),
          ),
          child: Center(
            child: Text(
              "S4S",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ),
        ListTile(
          title: Text(
            'Account',
            style: GoogleFonts.signika(
              fontSize: 17.0,
              color: Colors.white,
            ),
          ),
          leading: Icon(
            Icons.account_circle_outlined,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Profile();
                },
              ),
            );
          },
        ),
        ListTile(
          title: Text(
            'Change/Find Doctor',
            style: GoogleFonts.signika(
              fontSize: 17.0,
              color: Colors.white,
            ),
          ),
          leading: Icon(
            Icons.list,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return FindDoctor();
                },
              ),
            );
          },
        ),
        // ListTile(
        //   title: Text(
        //     'Settings',
        //     style: GoogleFonts.signika(
        //       fontSize: 17.0,
        //     ),
        //   ),
        //   leading: Icon(
        //     Icons.settings,
        //     color: Colors.black,
        //   ),
        //   onTap: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) {
        //           return Settings();
        //         },
        //       ),
        //     );
        //   },
        // ),
        ListTile(
          title: Text('Privacy Policy',
              style: GoogleFonts.signika(
                fontSize: 17.0,
                color: Colors.white,
              )),
          leading: Icon(
            Icons.privacy_tip,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return PrivacyPolicy();
                },
              ),
            );
          },
        ),
        ListTile(
          title: Text('Log Out',
              style: GoogleFonts.signika(
                fontSize: 17.0,
                color: Colors.white,
              )),
          leading: Icon(
            Icons.logout,
            color: Colors.white,
          ),
          onTap: () {
            storage.deleteItem('user');
            storage.clear();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return WelcomePage();
                },
              ),
            );
          },
        ),
      ],
    ),
  );
}
