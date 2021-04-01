import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/entity/CurrentUser.dart';
import '../../widgets/customAppBar.dart';
import '../Home/HomeUI.dart';
import '../../widgets/bottomNavBar.dart';
import '../../widgets/animation.dart';
import '../../widgets/customIcons.dart';
import 'package:flutter_app/control/Authenticator.dart';
import '../../widgets/ProfileWidgets/ProfileMenu.dart';
import '../../widgets/ProfileWidgets/ProfilePic.dart';

class Profile extends StatefulWidget {
  static String routeName = '/profile';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) => Scaffold(
      resizeToAvoidBottomInset: false,
    appBar: myAppBar('Profile', context, HomeUI()),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            FadeAnimation_Y(1,ProfilePic()),

            SizedBox(height: 20),

            FadeAnimation_Y(1,Text(getProfileName(), style: TextStyle( //name
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),)),

            SizedBox(height: 2),

            FadeAnimation_Y(1,Text(getEmail(), style: TextStyle( //email
              fontSize: 18,
            ),)),

            SizedBox(height: 20),

            FadeAnimation_Y(1,ProfileMenu(
              text: "My Dietary Preferences",
              icon: Icon(MyFlutterApp.cutlery),
              press: () => {
                // Navigator.pop(context),
                Navigator.pushNamed(context, '/editPref')
              },
            )),

            // FadeAnimation_Y(1,ProfileMenu(
            //   text: "My Intolerances",
            //   icon: Icon(Icons.dangerous),
            //   press: () => {
            //     // Navigator.pop(context),
            //     Navigator.pushNamed(context, '/editIntolerance')},
            // )),

            FadeAnimation_Y(1,ProfileMenu(
              text: "Log Out",
              icon: Icon(Icons.logout),
              press: () => {
                signOutGoogle(),
                Navigator.pop(context),
                Navigator.pushNamed(context, '/login')
              },
            )),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.profile));


}
