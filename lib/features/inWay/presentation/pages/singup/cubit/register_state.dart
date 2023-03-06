part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class ChaneIconVisibalty extends RegisterState {}

class ChangeCountry extends RegisterState {}

class PhoneDoneWrite extends RegisterState {}

class SendPhoneCodeLoading extends RegisterState {}

class SendPhoneCodeDone extends RegisterState {}

class SendPhoneCodeError extends RegisterState {
  final String e;
  SendPhoneCodeError(this.e);
}

class VerificationLoading extends RegisterState {}

class VerificationDone extends RegisterState {}

class VerificationError extends RegisterState {}

class SaveOTP extends RegisterState {}

class CerateUserDateWithEmailLoading extends RegisterState {}

class CerateUserDateWithEmailDone extends RegisterState {}

class CerateUserDateWithEmailError extends RegisterState {}

class CerateUserDateWithPhoneLoading extends RegisterState {}

class CerateUserDateWithPhoneDone extends RegisterState {}

class CerateUserDateWithPhoneError extends RegisterState {}

class SingInWithEmailandPasswordLoading extends RegisterState {}

class SingInWithEmailandPasswordDone extends RegisterState {}

class SingInWithEmailandPasswordError extends RegisterState {
  final String e;
  SingInWithEmailandPasswordError(this.e);
}
