//import 'package:MyDen/constants/ConstantTextField.dart';
//import 'package:MyDen/constants/Constant_colors.dart';
//import 'package:MyDen/constants/bezierContainer.dart';
//import 'package:MyDen/loginScreen/ActivationScreen.dart';
//import 'package:MyDen/model/sharedperef.dart';
//import 'package:MyDen/model/user_model.dart';
//import 'package:MyDen/resources/auth_methods.dart';
//import 'package:MyDen/resources/firebase_repository.dart';
//import 'package:MyDen/screens/checkAccessList.dart';
//import 'package:MyDen/screens/tabScreen.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myden/constants/ConstantTextField.dart';
import 'package:myden/constants/Constant_colors.dart';
import 'package:myden/constants/bezierContainer.dart';

import 'AdminSignUp.dart';
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'AdminSignUp.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
//  AuthService authService = new AuthService();
//  DatabaseMethods databaseMethods = DatabaseMethods();
//
//
//  static final FacebookLogin facebookSignIn = new FacebookLogin();
//  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String _message = '';
  TextEditingController _controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
//  final GoogleSignIn googleSignIn = GoogleSignIn();
//  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//  SharedPreferences prefs;

  bool isLoginPressed = false;

//  User user = User();
//
//  bool isLoading = false;
//  bool isLoggedIn = false;
//  FirebaseUser currentUser;
//  QuerySnapshot snapshotUserInfo;
//
//  @override
//  void initState() {
//
//    setState(() {
//      savelocalCode().toSaveStringValue(activationWith, _controller.text);
//      isLoading = false;
//    });
//    super.initState();
//
//
//  }

  @override
//  Future<void> resetPassword(String email) async {
//    await _firebaseAuth.sendPasswordResetEmail(email: email);
//
//  }
  Widget _submitButton(
      TextEditingController email, TextEditingController password) {
    return GestureDetector(
      onTap: () {
        if (formKey.currentState.validate()) {
          setState(() {
            //   isLoading = true;
          });
          FocusScope.of(context).unfocus();
          //signInWithEmail(email.text, password.text);
        }
      },
      child: Container(
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          color: UniversalVariables.background,
        ),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _facebookButton() {
    return GestureDetector(
      onTap: () {
        //  _login(user);
      },
      child: Container(
        height: 40,
        margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff1959a9),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('f',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff2872ba),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('Log in with Facebook',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _googleButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _controller.text = "GoogleLogin";
          //  isLoading = true;
        });
        //  googleLogin();
      },
      child: Container(
        height: 40,
        margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('G',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('Log in with Google',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: UniversalVariables.background,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(text: 'My',
//          style: GoogleFonts.portLligatSans(
//            color: UniversalVariables.background,
//            fontSize: 35,
//            fontWeight: FontWeight.w700,
//          ),
          children: [
            TextSpan(
              text: 'D',
              style: TextStyle(color: Colors.black, fontSize: 35),
            ),
            TextSpan(
              text: 'en',
              style:
                  TextStyle(color: UniversalVariables.background, fontSize: 35),
            ),
          ]),
    );
  }

  Widget _wlcmtitle() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(text: 'Wel',
//          style: GoogleFonts.portLligatSans(
//            color: UniversalVariables.background,
//            fontSize: 30,
//            fontWeight: FontWeight.w700,
//          ),
          children: [
            TextSpan(
              text: 'Come',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: ' To',
              style:
                  TextStyle(color: UniversalVariables.background, fontSize: 30),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: -height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainer()),
              Stack(children: [
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.50,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: height * .17),
                          Row(children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _wlcmtitle(),
                                  Row(children: [
                                    SizedBox(
                                      width: 80,
                                    ),
                                    _title()
                                  ])
                                ])
                          ]),
                          SizedBox(height: 50),
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                constantTextField().InputField(
                                    "Enter Email id",
                                    "abc@gmail.com",
                                    validationKey.email,
                                    _emailController,
                                    false,
                                    IconButton(
                                        icon: Icon(Icons.arrow_drop_down),
                                        onPressed: null),
                                    1,
                                    TextInputType.emailAddress),
                                SizedBox(
                                  height: 10,
                                ),
                                constantTextField().InputField(
                                    "Enter Password",
                                    "abc@gmail.com",
                                    validationKey.password,
                                    _passwordController,
                                    false,
                                    IconButton(
                                      icon: Icon(Icons.remove_red_eye),
                                      onPressed: () {},
                                    ),
                                    1,
                                    TextInputType.emailAddress)
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          _submitButton(_emailController, _passwordController),
                          Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  //  resetPassword(_emailController.text);
                                  showScaffold(
                                      "Change Password link is send to your mail");
                                },
                                child: Text('Forgot Password ?',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                              )),
                          _divider(),
                          _facebookButton(),
                          _googleButton(),
                          SizedBox(
                            height: 5,
                          ),
                          _createAccountLabel(),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
              // Positioned(top: 40, left: 0, child: _backButton()),
//              Positioned(
//                  //    child: isLoading ? Center(child: CircularProgressIndicator(),) : Container(),
//                  ),
            ],
          ),
        ));
  }

//  void signInWithEmail(String email,String password){
//    print(password);
//    databaseMethods.signInWithEmail(email, password).then((FirebaseUser user){
//      if (user != null) {
//        authenticateUser(user);
//      } else {
//        print("There was an error");
//      }
//    });
//  }
//
//  void googleLogin() {
//    print("tring to perform login");
//    databaseMethods.signIn().then((FirebaseUser user) {
//      print("something");
//      if (user != null) {
//        authenticateUser(user);
//      }
//    });
//  }
//
//
//  void authenticateUser(FirebaseUser user) {
//    setState(() {
//      isLoginPressed = false;
//    });
//    databaseMethods.authenticateUser(user).then((isNewUser) {
//      if (isNewUser) {
//        databaseMethods.addDataToDb(user).then((value) {
//          Navigator.pushReplacement(context,
//              MaterialPageRoute(builder: (context) {
//                return ActivationScreen();
//              }));
//        });
//      } else {
//        Navigator.pushReplacement(context,
//            MaterialPageRoute(builder: (context) {
//              return accessList();
//            }));
//      }
//    });
//
//
//  }
//  //
//  //
//  // Future<Null> _login() async {
//  //
//  //   final FacebookLoginResult result =
//  //   await facebookSignIn.logIn(['email']);
//  //
//  //   switch (result.status) {
//  //     case FacebookLoginStatus.loggedIn:
//  //       final FacebookAccessToken accessToken = result.accessToken;
//  //       _showMessage('''
//  //        Logged in!
//  //
//  //        Token: ${accessToken.token}
//  //        User id: ${accessToken.userId}
//  //        Expires: ${accessToken.expires}
//  //        Permissions: ${accessToken.permissions}
//  //        Declined permissions: ${accessToken.declinedPermissions}
//  //        ''');
//  //       databaseMethods.addDataToDb(user).then((value) {
//  //         Navigator.pushReplacement(context,
//  //             MaterialPageRoute(builder: (context) {
//  //               return ActivationScreen();
//  //             }));
//  //       });
//  //
//  //       break;
//  //     case FacebookLoginStatus.cancelledByUser:
//  //       _showMessage('Login cancelled by the user.');
//  //       break;
//  //     case FacebookLoginStatus.error:
//  //       _showMessage('Something went wrong with the login process.\n'
//  //           'Here\'s the error Facebook gave us: ${result.errorMessage}');
//  //       break;
//  //   }
//  //
//  // }
//  void _showMessage(String message) {
//    setState(() {
//      _message = message;
//    });
//  }

}
