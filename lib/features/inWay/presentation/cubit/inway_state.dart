part of 'inway_cubit.dart';

abstract class InwayState {
  // const InwayState();
  // List<Object> get props => [];
}

class UpdateTextPosition extends InwayState {
  final bool isBelowIcon;

  UpdateTextPosition(this.isBelowIcon);
}

class InwayInitial extends InwayState {}

class SingOut extends InwayState {}

class PickProfileImage extends InwayState {}

class GetUserDateLoading extends InwayState {}

class GetUserDateDone extends InwayState {}

class UploadProfileImageLoading extends InwayState {}

class UploadProfileImageDone extends InwayState {}

class UploadProfileImageError extends InwayState {}
class EditProfileLoading extends InwayState {}

class EditProfileDone extends InwayState {}

class EditProfileError extends InwayState {}

class GetUserDateError extends InwayState {}

class ChangeIndex extends InwayState {}

class GetMyLocationLoading extends InwayState {}

class GetMyLocationDone extends InwayState {}

class ChangeColorActivity extends InwayState {}
