import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omnikit/controllers/auth_controller.dart';
import 'package:omnikit/controllers/cart_products.dart';

import 'package:omnikit/pages/pages.dart';
import 'dart:math';

import 'package:omnikit/services/backend_auth_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _deviceHeight;
  double _deviceWidth;
  String _userId;
  String _email;
  String _password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  BackEndAuthService authRequest = BackEndAuthService();

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.grey[50],
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height * .1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child: Container(
                        // margin: EdgeInsets.only(top: 60),
                        height: 200.0,
                        width: 200.0,
                        child: Image(
                          image: AssetImage('assets/images/omnikit.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
                TypewriterAnimatedTextKit(
                  speed: Duration(milliseconds: 200),
                  text: ['Shop.Anywhere. Everywhere.'],
                  totalRepeatCount: 1,
                  textStyle: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 30.0),
                SizedBox(height: _deviceHeight * 0.01),
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _emailTextField(),
                      SizedBox(height: _deviceHeight * 0.05),
                      _passwordTextField(),
                      SizedBox(height: _deviceHeight * 0.1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * .3,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: Colors.lime,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: GetBuilder<AuthController>(
                              init: AuthController(),
                              builder: (val) => FlatButton(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                                onPressed: () {
                                  //1. save the email
                                  formKey.currentState.save();
                                  // 2. save auth data i.e bearer for MAS and save into the data variable
                                  // dynamic authData = authRequest.getBearer();
                                  // print(authData['access_token'].toString());
                                  val.getBearer();
                                  // 3. generate a userID or payload to be scored with ESP
                                  _userId = _assignUserID().toString();
                                  //4 . Route to the loading page to fetch results from ESP
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => LoadingScreen(
                                          id: _userId,
                                          email: _email,
                                        ),
                                      ));

                                  print(
                                      'The email is $_email'); // log to the console.
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .3,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: Colors.amberAccent,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: GetBuilder<UserCartProductsController>(
                              init: UserCartProductsController(),
                              builder: (val) => FlatButton(
                                child: Text('Create Account',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 2.0,
                                    ),
                                    textAlign: TextAlign.center),
                                onPressed: () async {
                                  formKey.currentState.save();
                                  print('The email is $_email');
                                  String user =
                                      _email.substring(0, _email.indexOf('@'));
                                  val.updateUser(user);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => LandingPage(
                                          email: _email,
                                        ),
                                      ));
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomSheet: Container(
          height: MediaQuery.of(context).size.height * .1,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              // color: Colors.white,
              ),
          child: Text(
            'Sample App - For Demonstration Purposes Only. Contact CCBU Advisory for more details.',
            style: TextStyle(
              color: Colors.black38,
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 2.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return Container(
      width: _deviceWidth * 0.70,
      child: TextFormField(
        cursorColor: Colors.black,
        autocorrect: false,
        onSaved: (val) => _email = val,
        style: TextStyle(color: Colors.black54),
        decoration: InputDecoration(
          hintText: "Enter your e-mail here",
          hintStyle: TextStyle(color: Colors.black54),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey),
          ),
        ),
      ),
    );
  }

  Widget _passwordTextField() {
    return Container(
      width: _deviceWidth * 0.70,
      child: TextFormField(
        obscureText: true,
        onSaved: (val) => _password = val,
        cursorColor: Colors.black,
        autocorrect: false,
        style: TextStyle(color: Colors.black54),
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle(color: Colors.black54),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey),
          ),
        ),
      ),
    );
  }
}

int _assignUserID() {
  Random randX = Random();
  return randX.nextInt(450) + 51;
}
