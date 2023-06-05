import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inway/blocobserver.dart';
import 'package:inway/cashe_helper.dart';
import 'package:inway/config/endpoint.dart';
import 'package:inway/features/inWay/presentation/constants/theam_manger.dart';
import 'package:inway/features/inWay/presentation/cubit/inway_cubit.dart';
import 'package:inway/features/inWay/presentation/pages/Home/home.dart';
import 'package:inway/features/inWay/presentation/pages/OnBoarding/onboarding_screen.dart';
import 'package:inway/features/inWay/presentation/pages/singup/cubit/register_cubit.dart';
import 'package:inway/features/inWay/presentation/pages/singup/email_verifiycation.dart';
import 'package:inway/features/inWay/presentation/pages/singup/register.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CasheHelper.init();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Widget widget;
  bool? onboarding = CasheHelper.getData('onboarding');
  uid = CasheHelper.getData('uid');
  if (onboarding == true) {
    if (uid == null) {
      widget = const RegisterScreen();
    } else {
      if (FirebaseAuth.instance.currentUser!.emailVerified == false) {
        widget = const EmailVerfifcation();
      }
      widget = const Home();
    }
  } else {
    widget = OnBoarding();
  }
  runApp(MyApp(startScreen: widget));
}

class MyApp extends StatelessWidget {
  final Widget? startScreen;
  const MyApp({super.key, this.startScreen});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InwayCubit()..getUserDate(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        )
      ],
      child: BlocConsumer<InwayCubit, InwayState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'inWay',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            themeMode: ThemeMode.light,
            home: startScreen,
          );
        },
      ),
    );
  }
}
