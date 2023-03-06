import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inway/features/inWay/data/models/userdate.dart';
import 'package:inway/config/endpoint.dart';
import 'package:inway/features/inWay/presentation/constants/navigation_manger.dart';
import 'package:inway/features/inWay/presentation/pages/singup/otb_screen.dart';
import 'package:inway/features/inWay/utils/utils.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  IconData suffixicon = Icons.visibility_off;
  bool obscureText = true;
  String? otb;
  void changevisibalty() {
    emit(RegisterInitial());
    obscureText = !obscureText;
    suffixicon = !obscureText ? Icons.visibility : Icons.visibility_off;
    emit(ChaneIconVisibalty());
  }

  Country country = Country(
      phoneCode: '20',
      countryCode: 'EG',
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: 'Egypt',
      example: 'Egypt',
      displayName: 'Egypt',
      displayNameNoCountryCode: 'EG',
      e164Key: '');
  void selectcountry(value) {
    emit(RegisterInitial());
    country = value;
    emit(ChangeCountry());
  }

  

  void phoneDone(value1, value2) {
    emit(RegisterInitial());
    value1 = value2;
    emit(PhoneDoneWrite());
  }

  Future<void> singinWithPhone(BuildContext context, phonenumber) async {
    emit(SendPhoneCodeLoading());
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phonenumber,
        verificationCompleted: (phoneAuthCredential) async {
          await firebaseAuth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          throw Exception(error.toString());
        },
        codeSent: (verificationId, forceResendingToken) {
          slideRightNaviget(OtbScreen(verificationId: verificationId), context);
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
      emit(SendPhoneCodeDone());
    } on FirebaseAuthException catch (error) {
      showMySnackBar(
          context: context, content: error.message.toString(), isError: true);
      debugPrint(error.message.toString());
      emit(SendPhoneCodeError(error.message.toString()));
    }
  }

  Future<void> verification(
      {required BuildContext context,
      required String otbcode,
      required String verificationId,
      required Function sucess}) async {
    emit(VerificationLoading());
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otbcode);
      User? user = (await firebaseAuth.signInWithCredential(credential)).user;
      if (user != null) {
        uid = user.uid;
        sucess();
      }

      emit(VerificationDone());
    } on FirebaseAuthException catch (e) {
      showMySnackBar(
          context: context, content: e.message.toString(), isError: true);
      emit(VerificationError());
    }
  }

  void saveotb(value) {
    emit(RegisterInitial());
    otb = value;
    emit(SaveOTP());
  }

  Future<bool> checkUser(
    context,
  ) async {
    DocumentSnapshot snapshot =
        await firebaseFirestore.collection('users').doc(uid).get();
    if (snapshot.exists) {
      debugPrint('User exists');
      return true;
    } else {
      debugPrint('User Notexists');
      return false;
    }
  }

  Future<void> cerateUserDateWithEmail({
    required BuildContext context,
    required String birth,
    required String email,
    required String name,
    required String password,
    required Function onsucess,
  }) async {
    emit(CerateUserDateWithEmailLoading());

    try {
      User? user = (await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
      if (user != null) {
        uid = user.uid;
        await user.sendEmailVerification();

        await cerateUserDate(
            birth: birth, email: email, name: name, uId: user.uid);
        await onsucess();
      }

      emit(CerateUserDateWithEmailDone());
    } on FirebaseAuthException catch (e) {
      showMySnackBar(
          context: context, content: e.message.toString(), isError: true);
      emit(CerateUserDateWithEmailError());
    }
  }

  Future<void> cerateUserDate({
    required String birth,
    String? email,
    required String name,
    required String uId,
  }) async {
    UserDate model = UserDate(
        birthdate: birth,
        dateTime: DateTime.now(),
        email: email,
        name: name,
        emailVerictions: firebaseAuth.currentUser?.emailVerified,
        phone: firebaseAuth.currentUser?.phoneNumber,
        image: firebaseAuth.currentUser?.email,
        uid: uid);
    await firebaseFirestore.collection('users').doc(uId).set(model.tomap());
  }

  Future<void> singInWithEmailandPassword({
    required BuildContext context,
    required String email,
    required String password,
    required Function onSucess,
  }) async {
    emit(SingInWithEmailandPasswordLoading());
    try {
      User? user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      if (user != null) {
        uid = user.uid;
        await onSucess();
      }
      emit(SingInWithEmailandPasswordDone());
    } on FirebaseAuthException catch (e) {
      showMySnackBar(
          context: context, content: e.message.toString(), isError: true);
      emit(SingInWithEmailandPasswordError(e.message.toString()));
    }
  }

  Future<void> cerateUserDateWithPhone({
    required BuildContext context,
    required String birth,
    required String name,
    required Function onsucess,
  }) async {
    emit(CerateUserDateWithPhoneLoading());

    try {
      await cerateUserDate(birth: birth, name: name, uId: uid!);
      await onsucess();

      emit(CerateUserDateWithPhoneDone());
    } on FirebaseAuthException catch (e) {
      showMySnackBar(
          context: context, content: e.message.toString(), isError: true);
      emit(CerateUserDateWithPhoneError());
    }
  }
}
