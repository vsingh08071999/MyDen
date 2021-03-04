import 'dart:convert';
import 'dart:core';
import 'package:MyDen/loginScreen/ActivationScreen.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:MyDen/model/user_model.dart';
import 'package:MyDen/loginScreen/EmailVerifactionScreen.dart';
import 'package:MyDen/constants/global.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBloc() : super(AuthBlocState.initial());

  final _firebaseAuth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;

  var _userData = UserData();

  Future<UserData> currentUser() async {
    var user = await _firebaseAuth.currentUser();
    return await _userFromFirebase(user);
  }

  UserData getCurrentUser() {
    return state.userData;
  }

  _tokenRegister(
    String uid,
  ) {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    _firebaseMessaging.getToken().then((token) {
      print("token is $token");
//      Firestore.instance
//          .collection("users")
//          .document(uid)
//          .setData({"tokenId": token}, merge: true);
////      saveTokenTosociety(token,uid,societyId,parentId);
    });
  }

  Future<void> updateUser(UserData userData) async {
    _userData = userData;
    add(AuthBlocEvent.setUpdate);
  }

  Future<UserData> _userFromFirebase(FirebaseUser user) async {
    _userData = UserData();
    if (user != null) {
      print('user exists');
      print(user.isEmailVerified);
      _userData = await _getUserDatatoFirestore(user.uid);
      print(_userData.uid);
      _userData.emailVerified = user.isEmailVerified;
      return _userData;
    } else {
      print('user dont exists');
      _userData = null;
      add(AuthBlocEvent.setUpdate);
      return _userData;
    }
  }

  Future<UserData> signInWithEmailAndPassword(
      String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    await _getUserDatatoFirestore(authResult.user.uid);
//    _tokenRegister(authResult.user.uid);
//    _saveUserDatatoFirestore(authResult);
//    _userFromFirebase(authResult.user);
    add(AuthBlocEvent.setUpdate);
    return _userData;
  }

  Future<UserData> createUserWithEmailAndPassword(
      String email, String password, context, String name) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = authResult.user;
    print("userID ${user.uid}");
    await _saveUserDatatoFirestore(authResult);
    _userData.name = name;
    await _firestore
        .collection("users")
        .document(user.uid)
        .setData({"name": name}, merge: true);
    add(AuthBlocEvent.setUpdate);
    print(
        'EmailVerified    ${user.toString() + user.isEmailVerified.toString() + user.email.toString()}');
    await user.sendEmailVerification();
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => EmailVerification(),
      ),
    );
  }

  Future<UserData> checkEmailVerification(BuildContext context) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final current = await _auth.currentUser();
    try {
      print("click");
      if (current.isEmailVerified) {
        print("Emailid verify");

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ActivationScreen()));
      } else {
        print("Email id is not verified");

        // showScaffold("First Verify Your email id");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<UserData> resendEmailVerification() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final current = await _auth.currentUser();
    try {
      current.sendEmailVerification();
      print("link is send");
    } catch (e) {
      print(e.toString());
    }
  }

  Future<UserData> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final authResult = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.getCredential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken,
          ),
        );

        _saveUserDatatoFirestore(authResult);
        _userData = await _userFromFirebase(authResult.user);
        print(jsonEncode(_userData));
        print("aaaa");
        add(AuthBlocEvent.setUpdate);
        return _userData;
      } else {
        throw PlatformException(
          code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
          message: 'Missing Google Auth Token',
        );
      }
    } else {
      throw PlatformException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
  }

//   Future<UserData> signInWithFacebook() async {
//     final facebookLogin = FacebookLogin();
//     final result = await facebookLogin.logIn(
//       ['public_profile'],
//     );
//     if (result.accessToken != null) {
//       final authResult = await _firebaseAuth.signInWithCredential(
//         FacebookAuthProvider.getCredential(
//           accessToken: result.accessToken.token,
//         ),
//       );
// //      _userFromFirebase(authResult.user);
//       _saveUserDatatoFirestore(authResult);
//       add(AuthBlocEvent.setUpdate);
//     } else {
//       throw PlatformException(
//         code: 'ERROR_ABORTED_BY_USER',
//         message: 'Sign in aborted by user',
//       );
//     }
//   }

  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    //  final facebookLogin = FacebookLogin();
    // await facebookLogin.logOut();
    await _firebaseAuth.signOut();
  }

  @override
  Stream<AuthBlocState> mapEventToState(AuthBlocEvent event) async* {
    switch (event) {
      case AuthBlocEvent.setUpdate:
        yield state.copyWith(userData: _userData);
        break;
    }
  }

  Future<UserData> _getUserDatatoFirestore(String uid) async {
    var path = USERS;
    var documentReference = _firestore.collection(path).document(uid);

    DocumentSnapshot documentSnapshot =
        await documentReference.get(source: Source.serverAndCache);

    if (!documentSnapshot.exists) {
      documentSnapshot = await documentReference.get(source: Source.server);
      if (!documentSnapshot.exists) {
        _userData = null;
      } else {
        _userData = UserData.fromMap(documentSnapshot.data);
        print(_userData.uid);
      }
    } else {
      print('cache');
      print('DocumentSnapshotdata ------- ${documentSnapshot.data}');
      _userData = UserData.fromMap(documentSnapshot.data);
      print(_userData.uid);
      print('Email ------- ${documentSnapshot.data['email']}');
      print("name is --- ${_userData.name}");
    }
    add(AuthBlocEvent.setUpdate);
    return _userData;
//    globals.userdata = _userData;
  }

  Future<void> _saveUserDatatoFirestore(AuthResult result) async {
    var path = USERS;
    var documentReference =
        _firestore.collection(path).document(result.user.uid);
    _userData = getGoogleAttributes(result);
    print(_userData);
    print("AuthBlock");
//    globals.userdata = _userData;
    await documentReference.setData(_userData.toJson(), merge: true);
  }

  UserData getGoogleAttributes(AuthResult result) {
    UserData userData = UserData(
      uid: result.user.providerData[0].uid,
      email: result.user.providerData[0].email,
      phoneNo: result.user.providerData[0].phoneNumber ?? '',
      name: result.user.providerData[0].displayName ?? '',
      profilePhoto: result.user.providerData[0].photoUrl ?? '',
    );

    return userData;
  }
}

enum AuthBlocEvent { setUpdate }

class AuthBlocState {
  UserData userData = UserData();

  AuthBlocState({this.userData});

  factory AuthBlocState.initial() {
    return AuthBlocState(userData: UserData());
  }

  AuthBlocState copyWith({UserData userData, bool authUser}) {
    return AuthBlocState(userData: userData ?? this.userData);
  }
}

enum LoginFlag { emailFlag, facebookFlag, googleFlag, phoneFlag }
