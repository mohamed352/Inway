import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inway/cashe_helper.dart';
import 'package:inway/features/inWay/presentation/constants/color_manger.dart';
import 'package:inway/config/endpoint.dart';
import 'package:inway/features/inWay/presentation/constants/image_manger.dart';
import 'package:inway/features/inWay/presentation/constants/navigation_manger.dart';
import 'package:inway/features/inWay/presentation/constants/sizes_manger.dart';
import 'package:inway/features/inWay/presentation/constants/textstyle_manger.dart';
import 'package:inway/features/inWay/presentation/constants/theam_manger.dart';
import 'package:inway/features/inWay/presentation/pages/Home/home.dart';
import 'package:inway/features/inWay/presentation/pages/singup/singup.dart';
import 'package:inway/features/inWay/presentation/widgets/elvatetdbutton.dart';
import 'package:inway/features/inWay/presentation/widgets/hellinetext.dart';
import 'package:inway/features/inWay/presentation/widgets/loading.dart';
import 'package:inway/features/inWay/presentation/widgets/mytextbutton.dart';
import 'package:pinput/pinput.dart';

import 'cubit/register_cubit.dart';

class OtbScreen extends StatelessWidget {
  final String verificationId;

  const OtbScreen({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = RegisterCubit.get(context);
        return AnnotatedRegion(
          value: lightStatusBar,
          child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white,
                body: LoadingAnimation(
                  conditionToLoading: state is VerificationLoading,
                  widget: ListView.builder(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(AppImagesAssets.lock),
                          const HeadLineText(
                              bigtext: 'Verification',
                              smaltext:
                                  "Enter the OTP Send to your phone number "),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: AppSizes.getHight(context, 15)),
                            child: Pinput(
                              length: 6,
                              closeKeyboardWhenCompleted: true,
                              showCursor: true,
                              defaultPinTheme: PinTheme(
                                  textStyle: MyTextStyle.meduimBold
                                      .copyWith(color: ColorApp.lightblue),
                                  width: AppSizes.getWidth(context, 60),
                                  height: AppSizes.getHight(context, 55),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: ColorApp.lightblue))),
                              onCompleted: (value) {
                                cubit.saveotb(value);
                              },
                            ),
                          ),
                          MyElvatedButton(
                              text: 'Verifiy',
                              color: ColorApp.lightblue,
                              onPressed: () {
                                cubit.verification(
                                    context: context,
                                    otbcode: cubit.otb!,
                                    verificationId: verificationId,
                                    sucess: () {
                                      cubit.checkUser(context).then((value) {
                                        if (value == true) {
                                          CasheHelper.savedata('uid', uid)
                                              .then((value) {
                                            return navigetandfinsih(
                                                const Home(), context);
                                          });
                                        } else {
                                          navigetandfinsih(
                                              Singup(
                                                userSingUpWithPhone: true,
                                              ),
                                              context);
                                        }
                                      });
                                    });
                              },
                              size: AppSizes.fullsize(context)),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: AppSizes.getHight(context, 15)),
                            child: Text(
                              'Don' '\'t recive any code?',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          MyTextButton(
                            text: 'Resend New Code',
                            ontap: () {},
                            paddinghorizontal: 0,
                            paddingvertical: 0,
                            textStyle: MyTextStyle.meduimBold
                                .copyWith(color: ColorApp.lightblue),
                          )
                        ],
                      ),
                    ),
                    itemCount: 1,
                    physics: const BouncingScrollPhysics(),
                  ),
                )),
          ),
        );
      },
    );
  }
}
