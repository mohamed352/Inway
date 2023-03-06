import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inway/features/inWay/presentation/constants/image_manger.dart';
import 'package:inway/features/inWay/presentation/constants/navigation_manger.dart';
import 'package:inway/features/inWay/presentation/constants/sizes_manger.dart';
import 'package:inway/features/inWay/presentation/constants/theam_manger.dart';
import 'package:inway/features/inWay/presentation/pages/singup/login/login_screen.dart';
import 'package:inway/features/inWay/presentation/pages/singup/phoneregister.dart';
import 'package:inway/features/inWay/presentation/widgets/elvatetdbutton.dart';
import 'package:inway/features/inWay/presentation/widgets/hellinetext.dart';

import '../../constants/color_manger.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: lightStatusBar,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImagesAssets.travilng),
                const HeadLineText(
                    bigtext: 'Get Connect to the best InWay',
                    smaltext:
                        'Easy way to connect wtih inWay to get easy road &ride comfrtoable'),
                SizedBox(
                  height: AppSizes.getHight(context, 120),
                ),
                MyElvatedButtonIcon(
                    text: 'Login with Google     ',
                    color: Colors.red,
                    criclecolor: Colors.white.withOpacity(0.3),
                    radius: 18,
                    paddingRight: 20,
                    icon: const FaIcon(
                      FontAwesomeIcons.google,
                      size: 22,
                      color: Colors.white,
                    ),
                    size: AppSizes.fullsize(context),
                    onPressed: () {}),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: MyElvatedButtonIcon(
                      text: 'Login with Facebook',
                      color: ColorApp.lightblue,
                      size: AppSizes.fullsize(context),
                      criclecolor: Colors.white.withOpacity(0.3),
                      radius: 18,
                      paddingRight: 20,
                      icon: const FaIcon(
                        FontAwesomeIcons.facebook,
                        size: 25,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                ),
                MyElvatedButtonIcon(
                    text: 'Login with Email       ',
                    color: ColorApp.lightblue.withOpacity(0.2),
                    onPressed: () {
                      slideRightNaviget(LoginScreen(), context);
                    },
                    size: AppSizes.fullsize(context),
                    icon: const Icon(
                      Icons.email,
                      color: Colors.white,
                      size: 22,
                    ),
                    textcolor: Colors.grey.shade600,
                    criclecolor: ColorApp.lightblue,
                    paddingRight: 20,
                    radius: 18),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: MyElvatedButtonIcon(
                      text: 'Login with Phone       ',
                      color: ColorApp.lightblue.withOpacity(0.2),
                      onPressed: () {
                        slideRightNaviget(PhoneAuth(), context);
                      },
                      size: AppSizes.fullsize(context),
                      icon: const Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: 22,
                      ),
                      textcolor: Colors.grey.shade600,
                      criclecolor: ColorApp.lightblue,
                      paddingRight: 20,
                      radius: 18),
                )
              ],
            ),
            itemCount: 1,
            physics: const BouncingScrollPhysics(),
          ),
        ),
      ),
    );
  }
}
