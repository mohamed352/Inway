import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inway/features/inWay/presentation/constants/color_manger.dart';
import 'package:inway/features/inWay/presentation/constants/image_manger.dart';
import 'package:inway/features/inWay/presentation/constants/sizes_manger.dart';
import 'package:inway/features/inWay/presentation/widgets/backbutton.dart';
import 'package:inway/features/inWay/presentation/widgets/elvatetdbutton.dart';
import 'package:inway/features/inWay/presentation/widgets/hellinetext.dart';
import 'package:inway/features/inWay/presentation/widgets/mytextbutton.dart';
import 'package:inway/features/inWay/presentation/widgets/textfromfield.dart';

class ForgetPassword extends StatelessWidget {
  final TextEditingController emailcontroller = TextEditingController();
  final fromkey = GlobalKey<FormState>();
  ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle current = SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark);
    return AnnotatedRegion(
      value: current,
      child: SafeArea(
        child: Material(
            color: Colors.white,
            child: ListView.builder(
              itemCount: 1,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) => Form(
                key: fromkey,
                child: SizedBox(
                  width: AppSizes.width(context),
                  height: AppSizes.height(context) * 1.1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 4,
                          right: AppSizes.width(context) * 0.4,
                        ),
                        child: MYBackButton(
                            circleColor: ColorApp.lightblue.withOpacity(0.1),
                            iconColor: ColorApp.lightblue),
                      ),
                      Image.asset(AppImagesAssets.lock),
                     const  HeadLineText(bigtext: 'Forget Password?', smaltext: 'Enter your resinged email below to recive password rest insteriction')
                     ,
                      SizedBox(height: AppSizes.height(context) * 0.05),
                      MyTextFromField(
                        controller: emailcontroller,
                        textInputType: TextInputType.emailAddress,
                        color: ColorApp.lightblue.withOpacity(0.1),
                        lapletext: ' E-mail',
                        perfixicon: Icon(
                          Icons.email,
                          color: ColorApp.lightblue,
                          size: 22,
                        ),
                        validate: (String value) => vildateemail(value),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: MyElvatedButton(
                            text: 'Send',
                            color: ColorApp.lightblue,
                            onPressed: () {
                              if (fromkey.currentState!.validate()) {}
                            },
                            size: AppSizes.fullsize(context)),
                      ),
                       SizedBox(
                        height: AppSizes.height(context)*0.18,
                      ),
                      MyTextButton(
                          text: 'Back to Login',
                          ontap: () {
                            Navigator.of(context).pop();
                          },
                          paddinghorizontal: 0,
                          paddingvertical: 0)
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
