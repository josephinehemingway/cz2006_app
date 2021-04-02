import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../widgets/animation.dart';
import '../../widgets/LoginWidgets/googleSignInButton.dart';


class LoginUI extends StatelessWidget {
  static String routeName = '/login';
  User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      children: <Widget>[

                        FadeAnimation_Y(1, Container(
                          //height: MediaQuery.of(context).size.height / 3,
                          // margin: EdgeInsets.only(top: 182, left: 10),
                          height: MediaQuery.of(context).size.width *0.5,
                          width: MediaQuery.of(context).size.width *0.65,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/loginui.png'),
                                  fit: BoxFit.fill
                              )
                          ),
                        )),
                        SizedBox(height: MediaQuery.of(context).size.height *0.02),

                        FadeAnimation_Y(1,
                            Text("h e a l t h y  g o  w h e r e", style: TextStyle(
                                fontSize: 25,
                                color: Colors.grey[700],
                                fontFamily: 'GlacialIndifference'
                              //fontWeight: FontWeight.bold
                            ),)),

                        SizedBox(height: 7,),

                        FadeAnimation_Y(
                            1, Text("healthy food everywhere", style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontFamily: 'GlacialIndifference'
                          //fontWeight: FontWeight.bold
                        ),)),
                        SizedBox(height: 20,),

                        FadeAnimation_Y(1.5, GoogleSignInButton()),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05, ),
                        FadeAnimation_Y(1, Container(
                          //height: MediaQuery.of(context).size.height / 3,
                          margin: EdgeInsets.only(top: 3),
                          height: 200,
                          width: 500,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/loginbottom.png'),
                                fit: BoxFit.fill,
                                alignment: Alignment.bottomCenter,
                              )
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }

}