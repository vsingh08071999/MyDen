// import 'package:MyDen/screens/tabScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:MyDen/Constants/Constant_colors.dart';
//
// class AdminSignUpScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: ListView(
//           children: [
//             SizedBox(
//               height: 50,
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: 100,
//               child: Stack(
//                 children: [
//                   Positioned(
//                     left: 40,
//                     child: Container(
//                       child: Text(
//                         "Welcome to",
//                         style: TextStyle(
//                             color: UniversalVariables.background,
//                             fontWeight: FontWeight.bold,fontSize: 25),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 120,
//                     top: 30,
//                     child: Container(
//                       child: Text(
//                         "MyDen",
//                         style: TextStyle(
//                             color: UniversalVariables.background,
//                             fontWeight: FontWeight.bold,fontSize: 32),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 50,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 25, right: 25),
//               child: Column(children: [
//                 Text(
//                   "Sign In",
//                   style: TextStyle(
//                       color: UniversalVariables.background,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: UniversalVariables.background,
//                         ),
//                         borderRadius: BorderRadius.circular(20.0),
//                       ),
//                       hintText: "Email",
//                     )),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextField(
//                     decoration: InputDecoration(
//                       suffixIcon: Icon(
//                         Icons.lock_outline,
//                         color: UniversalVariables.background,
//                       ),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: UniversalVariables.background,
//                         ),
//                         borderRadius: BorderRadius.circular(20.0),
//                       ),
//                       hintText: "Password",
//                     )),
//
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(22),
//                     color: UniversalVariables.background,
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                         left: 50, right: 50, top: 10, bottom: 10),
//                     child: Text(
//                       "Register",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text("---------0r---------"),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     CircleAvatar(
//                       child: Text("f",style: TextStyle(fontSize: 35),),
//                     ),
//                     CircleAvatar(
//                       child: Text("G",style: TextStyle(fontSize: 35),),
//                     )
//                   ],
//                 ),
//                 SizedBox(height: 30,),
//                 GestureDetector(
//                   onTap: (){
//                     Navigator.push(context, MaterialPageRoute(
//                         builder: (context)=>TabBarScreen()));
//                   },
//                   child: Text(
//                     "Already have an Account",
//                     style: TextStyle(
//                         color: UniversalVariables.background,
//                         fontSize: 20,
//                         fontStyle: FontStyle.italic),
//                   ),
//                 ),
//               ]),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//import 'dart:async';
//
//import 'package:MyDen/constants/ConstantTextField.dart';
//import 'package:MyDen/constants/Constant_colors.dart';
//import 'package:MyDen/constants/bezierContainer.dart';
//import 'package:MyDen/loginScreen/EmailVerifactionScreen.dart';
//import 'package:MyDen/model/sharedperef.dart';
//import 'package:MyDen/model/user_model.dart';
//import 'package:MyDen/resources/auth_methods.dart';
//import 'package:MyDen/resources/firebase_repository.dart';
//import 'package:MyDen/resources/sharedPref.dart';
//import 'package:MyDen/screens/tabScreen.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myden/constants/Constant_colors.dart';
import 'package:myden/constants/bezierContainer.dart';

import 'AdminSignIn.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'ActivationScreen.dart';
//import 'AdminSignIn.dart';
////import 'file:///Users/mobile/Downloads/MyDen-master/lib/constants/bezierContainer.dart';
//
//import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  // SignUpPage({Key key, this.title}) : super(key: key);
  //
  // final String title;
  // Timer _timer;
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isUserEmailVerified;
  // Timer _timer;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _controller = TextEditingController();

//  AuthService authService = new AuthService();
//  DatabaseMethods databaseMethods = new DatabaseMethods();
//  SharedePref sharedePref = new SharedePref();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  // @override
  // void initState() {
  //
  //   setState(() {
  //   //  isLoading = false;
  //   });
  //   super.initState();
  //
  //
  // }
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(children: [
            Icon(Icons.arrow_back_ios, color: Colors.black),
            SizedBox(
              width: 5,
            ),
            Text('Back',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
          ]),
        ),
      ),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () {
        //  singUp();
      },
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
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
            color: UniversalVariables.background),
        child: Text(
          'Register Now',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
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

// void singUp()   {
//    if (formKey.currentState.validate()) {
//      setState(() {
//        _controller.text = "emailLogin";
//        isLoading = true;
//      });
//      databaseMethods.signUpWithEmail(
//          _emailController.text,
//          _passwordController.text,
//          _userNameController.text).then((FirebaseUser user) async {
//         print("something");
//         try{
//           await user.sendEmailVerification();
//           savelocalCode().toSaveStringValue(activationWith, _controller.text);
//           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>emailVerification(
//             name: _userNameController.text,
//           )));
//         } catch(e){
//          print(e);
//         }
//      });
//    }
//  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    _backButton(),
                    SizedBox(height: height * .10),
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
                    SizedBox(
                      height: 50,
                    ),
//                    Form(
//                      key: formKey,
//                      child: Column(
//                        children: [
//                          constantTextField().InputField(
//                              "UserName",
//                              "Ronak Singh",
//                              validationKey.name,
//                              _userNameController,
//                              false,
//                              IconButton(
//                                  icon: Icon(Icons.arrow_drop_down),
//                                  onPressed: null),
//                              1,TextInputType.emailAddress),
//                          SizedBox(
//                            height: 10,
//                          ),
//                          constantTextField().InputField(
//                              "Enter Email id",
//                              "abc@gmail.com",
//                              validationKey.email,
//                              _emailController,
//                              false,
//                              IconButton(
//                                  icon: Icon(Icons.arrow_drop_down),
//                                  onPressed: null),
//                              1,TextInputType.emailAddress),
//                          SizedBox(
//                            height: 10,
//                          ),
//                          constantTextField().InputField(
//                              "Enter Password",
//                              "abc@gmail.com",
//                              validationKey.password,
//                              _passwordController,
//                              true,
//                              IconButton(
//                                  icon: Icon(Icons.remove_red_eye),
//                                  onPressed: null),
//                              1,TextInputType.emailAddress),
//                        ],
//                      ),
//                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    SizedBox(height: height * .14),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }

//  void authenticateUser(FirebaseUser user) {
//    databaseMethods.authenticateUser(user).then((isNewUser) {
//      if (isNewUser) {
//        print(user.displayName);
//        print(user.email);
//        Map userData = {
//          "uid":user.uid,
//      "email":user.email,
//      "displayName":_userNameController.text,
//      "photoUrl":""};
//        databaseMethods.addDataAfterSignUp(userData).then((value) {
//          Navigator.pushReplacement(context,
//              MaterialPageRoute(builder: (context) {
//                return ActivationScreen();
//              }));
//        });
//      } else {
//        print(("pankaj add Old user"));
//        Navigator.pushReplacement(context,
//            MaterialPageRoute(builder: (context) {
//              return TabBarScreen();
//            }));
//      }
//    });
//  }
//  Future<void> _showDialog() async {
//    return showDialog<void>(
//      context: context,
//      barrierDismissible: false, // user must tap button!
//      builder: (BuildContext context) {
//        return AlertDialog(
//          // title: Text('AlertDialog Title'),
//          content: SingleChildScrollView(
//            child: ListBody(
//              children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//
//                 CircularProgressIndicator(
//
//                 ),
//               ],),
//                Text(
//                "A link is send to your Email  id plz Click on it to verify",
//            style: TextStyle(color: UniversalVariables.background),
//                ),
//              ],
//            ),
//          ),
//        );
//      },
//    );
//  }
//
//Future<void> _showCompletVerification() async {
//  return showDialog<void>(
//    context: context,
//    barrierDismissible: false, // user must tap button!
//    builder: (BuildContext context) {
//      return AlertDialog(
//       // backgroundColor: Colors.transparent,
//        // title: Text('AlertDialog Title'),
//        content: SingleChildScrollView(
//          child: ListBody(
//            children: <Widget>[
//              Text(
//                "Your email is verified",
//                style: TextStyle(color: UniversalVariables.background),
//              ),
//            ],
//          ),
//        ),
//        actions: <Widget>[
//          RaisedButton(
//            child: Text('ok'),
//            onPressed: () {
//              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ActivationScreen()));
//
//            },
//          ),
//        ],
//      );
//    },
//  );
//}

}
