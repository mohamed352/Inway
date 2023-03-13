import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inway/features/inWay/presentation/constants/color_manger.dart';
import 'package:inway/features/inWay/presentation/constants/navigation_manger.dart';
import 'package:inway/features/inWay/presentation/constants/sizes_manger.dart';
import 'package:inway/features/inWay/presentation/constants/theam_manger.dart';
import 'package:inway/features/inWay/presentation/pages/Home/home.dart';
import 'package:inway/features/inWay/presentation/widgets/hellinetext.dart';

class EmailVerfifcation extends StatefulWidget {
  const EmailVerfifcation({super.key});

  @override
  State<EmailVerfifcation> createState() => _EmailVerfifcationState();
}

class _EmailVerfifcationState extends State<EmailVerfifcation> {
  @override
  void initState() {
    
    super.initState();
    Timer(const Duration(seconds: 5),
        () => navigetandfinsih( const Home(), context));
  }
  @override
  Widget build(BuildContext context) {
    return 
     
       AnnotatedRegion(
        value: lightStatusBar,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SizedBox(
              width: AppSizes.width(context),
              height: AppSizes.height(context),
              child: Padding(
                padding:
                    EdgeInsets.only(top: AppSizes.getHight(context, 100)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        backgroundColor: ColorApp.lightblue.withOpacity(0.2),
                        radius: 100,
                        child: FaIcon(
                          FontAwesomeIcons.envelopeOpenText,
                          size: 130,
                          color: ColorApp.lightblue.withOpacity(0.9),
                        )),
                    HeadLineText(
                        bigtext: 'Check your email',
                        smaltext:
                            'We have send email verifiycation to your ${FirebaseAuth.instance.currentUser?.email}')
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    
  }
}
