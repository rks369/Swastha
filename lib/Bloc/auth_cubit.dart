import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swastha/models/user_model.dart';
import 'package:swastha/screens/user_detail.dart';
import 'package:swastha/services/change_screen.dart';

enum authstate {
  init,
  loading,
  otpSend,
  otpVerified,
  registered,
  unRegistered,
  loggedIn,
  loggedOut,
  error
}

class AuthCubit extends Cubit<authstate> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? error;
  User? user;

  late UserModel userModel;

  AuthCubit() : super(authstate.init) {
    user = _auth.currentUser;
    if (user != null) {
      _firestore.collection('users').doc(user!.uid).get().then((value) {
        if (value.exists) {
          final data = value.data();

          userModel = userModelFromJSON(data!);

          emit(authstate.loggedIn);
        } else {
          emit(authstate.unRegistered);
        }
      });
    } else {
      emit(authstate.loggedOut);
    }
  }

  String? _verificationId;

  void sendOTP(String phoneNumber) async {
    emit(authstate.loading);
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      codeSent: (verificationId, forceResendingToken) {
        _verificationId = verificationId;
        emit(authstate.otpSend);
      },
      verificationCompleted: (phoneAuthCredential) {
        signInWithPhone(phoneAuthCredential);
      },
      verificationFailed: (error) {
        emit(authstate.error);
      },
      codeAutoRetrievalTimeout: (verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  void verifyOTP(String otp) async {
    emit(authstate.loading);
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!, smsCode: otp);

    signInWithPhone(credential);
  }

  void register(UserModel userModel) async {
    this.userModel = userModel;
    await _firestore
        .collection('users')
        .doc(user!.uid)
        .set(userModel.toJSON())
        .then((value) => {emit(authstate.loggedIn)});
  }

  void signInWithPhone(PhoneAuthCredential credential) async {
    try {
      user = await _auth
          .signInWithCredential(credential)
          .then((value) => value.user);

      if (user != null) {
        _firestore.collection('users').doc(user!.uid).get().then((value) {
          if (value.exists) {
            final data = value.data();

            userModel = userModelFromJSON(data!);
            emit(authstate.loggedIn);
          } else {
            emit(authstate.unRegistered);
          }
        });
      }
    } on FirebaseAuthException catch (e) {
      error = e.toString();
    }
  }

  void logOut() async {
    await _auth.signOut();
    emit(authstate.loggedOut);
  }
}
