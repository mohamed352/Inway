part of 'inway_cubit.dart';

abstract class InwayState {
  // const InwayState();
  // List<Object> get props => [];
}

class InwayInitial extends InwayState {}
class SingOut extends InwayState {}
class GetUserDateLoading extends InwayState {}
class GetUserDateDone extends InwayState {}

class GetUserDateError extends InwayState {}
class ChangeIndex extends InwayState {}
class GetMyLocationLoading  extends InwayState {}
class GetMyLocationDone extends InwayState {}
class ChangeColorActivity extends InwayState {}

