import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../widgets/customIcons.dart';
import '../Eateries/EateriesListUI.dart';
import '../../widgets/HomeWidgets/HomeMenu.dart';
import '../../widgets/ProfileWidgets/ProfilePic.dart';
import '../Recipe/RecipesListUI.dart';
import '../../widgets/animation.dart';
import '../../widgets/bottomNavBar.dart';
import 'package:flutter_app/boundary/widgets/animation.dart';

/// This is the boundary class which displays the Home Screen in the mobile UI.
class HomeUI extends StatefulWidget {

  /// The route name for navigation to [HomeUI].
  static String routeName = '/home';

  @override
  _HomeUIState createState() => _HomeUIState();
}

/// This class manages the state of the [HomeUI].
class _HomeUIState extends State<HomeUI> {

  /// Widget Build method for [HomeUI].
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: double.infinity,

            // The elements of the Home screen.
            //
            // Includes:
            // - Page background
            // - User's profile picture
            // - Descriptive Text widgets
            // - Buttons to navigate to [HealthyEateriesList] and [HealthyRecipesList]
            child: Column(
                children: <Widget>[
                  Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 2.5,
                          margin: EdgeInsets.only(),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/homepage.png'),
                                  fit: BoxFit.fill
                              )
                          ),
                          child: Align(
                              alignment: Alignment(0.05,0.8),
                              child: FadeAnimation(1, ProfilePic())),),
                      ]
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Column(
                            children: <Widget>[
                              SizedBox(height: 10,),
                              FadeAnimation(
                                  1, Text("Welcome Back!", style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold
                              ),)),

                              SizedBox(height: 15,),

                              FadeAnimation(1, Text(
                                "here's to a healthier you!", style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.grey[700]
                              ),)),

                              SizedBox(height: 10,),

                              FadeAnimation(1, Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Tune in to our healthy food",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.grey)),
                                  Text("recommendations anytime, anywhere!",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.grey)),
                                ],)),

                              SizedBox(height: 20,),

                              FadeAnimation(1,
                                  HomeMenu(
                                      title: "Eating Out?",
                                      subtitle: "healthy eateries nearby",
                                      NextPg: HealthyEateriesList(),
                                      customIcon: Icon(MyFlutterApp.cutlery, color: Colors.white, size: 30))
                              ),
                              SizedBox(height: 10,),

                              FadeAnimation(1, HomeMenu(
                                  title: "Eating at home?",
                                  subtitle: "healthy recipes for you",
                                  NextPg: HealthyRecipesList(),
                                  customIcon: Icon(MyFlutterApp.chefhat, color: Colors.white))
                              ),
                            ]),
                      ],
                    ),
                  )
                ])
        ),
        bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.home),
      );
}
