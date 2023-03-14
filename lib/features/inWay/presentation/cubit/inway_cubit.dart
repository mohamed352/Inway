import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inway/cashe_helper.dart';
import 'package:inway/config/endpoint.dart';
import 'package:inway/features/inWay/data/models/userdate.dart';
import 'package:inway/features/inWay/presentation/pages/Home/account.dart';
import 'package:inway/features/inWay/presentation/pages/Home/activity.dart';
import 'package:inway/features/inWay/presentation/pages/Home/homescreen.dart';
import 'package:inway/features/inWay/presentation/pages/Home/servies.dart';
import 'package:inway/features/inWay/utils/utils.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:permission_handler/permission_handler.dart';

part 'inway_state.dart';

class InwayCubit extends Cubit<InwayState> {
  InwayCubit() : super(InwayInitial());
  static InwayCubit get(context) => BlocProvider.of(context);
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final firebasestorage = firebase_storage.FirebaseStorage.instance;
  int curentpage = 0;
  void changeindactor(int activepage) {
    emit(InwayInitial());
    curentpage = activepage;
  }

  List<String> activityColor = ['All'];

  void changeColorActivity(
      {required String text,
      required String retext1,
      required String retext2}) {
    emit(InwayInitial());
    if (activityColor.contains(text)) {
      activityColor.clear();
    } else {
      activityColor.add(text);
      activityColor.remove(retext1);
      activityColor.remove(retext2);
    }

    emit(ChangeColorActivity());
  }

  int index = 0;
  void changeIndex(inDex) {
    emit(InwayInitial());
    index = inDex;
    emit(ChangeIndex());
  }

  List<Widget> screen = [
    HomeScreen(),
    const Serives(),
    const Activity(),
    const Account(),
  ];
  List<BottomNavigationBarItem> item = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.grip),
      label: 'Services',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.local_activity),
      label: 'Activity',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Account',
    ),
  ];
  bool onboarding = false;
  UserDate? userDate;
  List<UserDate> listUserDate = [];
  Future<void> getUserDate() async {
    if (uid != null) {
      emit(GetUserDateLoading());
      try {
        firebaseFirestore.collection('users').snapshots().listen((event) {
          for (var elemnt in event.docs) {
            if (elemnt.data()['uid'] == uid) {
              userDate = UserDate.fromjson(elemnt.data());
              listUserDate.add(UserDate.fromjson(elemnt.data()));
              emit(GetUserDateDone());
            }
          }
        });
      } on FirebaseException catch (e) {
        debugPrint(e.message.toString());
        emit(GetUserDateError());
      }
    }
  }

  Future<void> singOut(context) async {
    try {
      await firebaseAuth.signOut();
      await CasheHelper.removeData('uid');

      emit(SingOut());
    } catch (e) {
      showMySnackBar(context: context, content: e.toString());
    }
  }

  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  void getCurrentLocation(conTroller, context) async {
    try {
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      LatLng latLng = LatLng(position.latitude, position.longitude);
      CameraPosition currentLocation = CameraPosition(
        bearing: 192.8334901395799,
        target: latLng,
        tilt: 59.440717697143555,
        zoom: 17.5,
      );

      final GoogleMapController controller = await conTroller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(currentLocation));
      //emit(GetMyLocationDone());
    } catch (e) {
      showMySnackBar(context: context, content: e.toString());
    }
  }

  var pick = ImagePicker();
  File? profileImage;
  Future<void> pickProfileImage(context) async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      final pickProfile = await pick.pickImage(source: ImageSource.gallery);
      if (pickProfile != null) {
        profileImage = File(pickProfile.path);
        emit(PickProfileImage());
      } else {
        showMySnackBar(context: context, content: 'No Image Selected');
      }
    } else {
      showMySnackBar(
          context: context, content: 'app not get permission', isError: true);
    }
  }

  Future<void> uploadImageProfile(context) async {
    emit(UploadProfileImageLoading());
    try {
      if (profileImage != null) {
        var ref = await firebasestorage
            .ref()
            .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
            .putFile(profileImage!);
        var imageUrl = await ref.ref.getDownloadURL();
        firebaseFirestore
            .collection('users')
            .doc(uid)
            .update({'image': imageUrl});
        profileImage = null;

        emit(UploadProfileImageDone());
      } else {
        showMySnackBar(
            context: context,
            content: 'Please Select Image Frist',
            isError: true);
      }
    } on firebase_storage.FirebaseException catch (e) {
      emit(UploadProfileImageError());
      showMySnackBar(
          context: context, content: e.message.toString(), isError: true);
    }
  }

  Future<void> udateProfile({
    required BuildContext context,
    String? name,
    String? email,
    String? phone,
    dynamic birthdate,
  }) async {
    emit(EditProfileLoading());
    try {
      firebaseFirestore.collection('users').doc(uid).update({
        if (phone != '' && phone != null) 'phone': phone,
        if (name != '' && name != null) 'name': name,
        if (email != '' && email != null) 'email': email,
         if (birthdate != '' && birthdate != null) 'birthdate': birthdate,

      });
    } on FirebaseException catch (e) {
      showMySnackBar(context: context, content: e.message.toString());
      emit(EditProfileError());
    }
  }
}
