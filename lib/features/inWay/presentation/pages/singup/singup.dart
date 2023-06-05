import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inway/cashe_helper.dart';
import 'package:inway/features/inWay/presentation/constants/color_manger.dart';
import 'package:inway/config/endpoint.dart';
import 'package:inway/features/inWay/presentation/constants/navigation_manger.dart';
import 'package:inway/features/inWay/presentation/constants/sizes_manger.dart';
import 'package:inway/features/inWay/presentation/constants/textstyle_manger.dart';
import 'package:inway/features/inWay/presentation/pages/Home/home.dart';
import 'package:inway/features/inWay/presentation/pages/singup/cubit/register_cubit.dart';
import 'package:inway/features/inWay/presentation/widgets/animation_text.dart';
import 'package:inway/features/inWay/presentation/widgets/elvatetdbutton.dart';
import 'package:inway/features/inWay/presentation/widgets/loading.dart';
import 'package:inway/features/inWay/presentation/widgets/register_splach.dart';
import 'package:inway/features/inWay/presentation/widgets/register_splach2.dart';
import 'package:inway/features/inWay/presentation/widgets/textfromfield.dart';

class Singup extends StatelessWidget {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController birthcontroller = TextEditingController();
  final bool userSingUpWithPhone;
  Singup({super.key, required this.userSingUpWithPhone});

  @override
  Widget build(BuildContext context) {
    final fromkey = GlobalKey<FormState>();
    return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          SystemUiOverlayStyle current = SystemUiOverlayStyle.light.copyWith(
              statusBarColor: ColorApp.lightblue,
              statusBarIconBrightness: Brightness.light);
          return AnnotatedRegion(
            value: current,
            child: SafeArea(
              child: Scaffold(
                  backgroundColor: ColorApp.lightblue,
                  body: LoadingAnimation(
                    conditionToLoading:
                        state is CerateUserDateWithEmailLoading ||
                            state is CerateUserDateWithPhoneLoading,
                    widget: ListView.builder(
                      itemCount: 1,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => Form(
                        key: fromkey,
                        child: Column(
                          children: [
                            RegisterSplach(
                                animationtext1: AnimationText(
                                    textStyle: MyTextStyle.animationstyle,
                                    listtext: [
                                  TypewriterAnimatedText('Continue',
                                      speed: const Duration(milliseconds: 300),
                                      curve: Curves.linearToEaseOut)
                                ])),
                            RegisterSplach2(
                                widget: Column(
                              children: [
                                MyTextFromField(
                                    controller: namecontroller,
                                    textInputType: TextInputType.name,
                                    color: ColorApp.lightblue.withOpacity(0.1),
                                    lapletext: 'Name',
                                    perfixicon: Icon(
                                      Icons.person,
                                      color: ColorApp.lightblue,
                                    ),
                                    validate: (String value) =>
                                        vildate(value, 'Name')),
                                if (!userSingUpWithPhone)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: MyTextFromField(
                                        controller: emailcontroller,
                                        textInputType:
                                            TextInputType.emailAddress,
                                        color:
                                            ColorApp.lightblue.withOpacity(0.1),
                                        lapletext: 'Email or phone',
                                        perfixicon: Icon(
                                          Icons.email,
                                          color: ColorApp.lightblue,
                                        ),
                                        validate: (String value) =>
                                            vildateemail(value)),
                                  ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: userSingUpWithPhone ? 10 : 0),
                                  child: MyTextFromField(
                                      controller: birthcontroller,
                                      textInputType: TextInputType.datetime,
                                      color:
                                          ColorApp.lightblue.withOpacity(0.1),
                                      lapletext: 'brithdate',
                                      perfixicon: Icon(
                                        Icons.calendar_month,
                                        color: ColorApp.lightblue,
                                      ),
                                      validate: (String value) =>
                                          vildate(value, 'brithdate')),
                                ),
                                if (!userSingUpWithPhone)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: MyTextFromField(
                                        controller: passwordcontroller,
                                        textInputType:
                                            TextInputType.visiblePassword,
                                        lapletext: 'password',
                                        color: ColorApp.lightblue.withOpacity(
                                          0.1,
                                        ),
                                        perfixicon: Icon(
                                          Icons.lock,
                                          color: ColorApp.lightblue,
                                        ),
                                        suifxicon: Icon(cubit.suffixicon),
                                        obscuretext: cubit.obscureText,
                                        ontapsuffixicon: () {
                                          cubit.changevisibalty();
                                        },
                                        validate: (String value) =>
                                            vildate(value, 'password')),
                                  ),
                                if (userSingUpWithPhone)
                                  SizedBox(
                                    height: AppSizes.getHight(context, 170),
                                  ),
                                MyElvatedButton(
                                    text: 'Register',
                                    color: ColorApp.lightblue,
                                    onPressed: () {
                                      if (fromkey.currentState!.validate()) {
                                        if (!userSingUpWithPhone) {
                                          cubit.cerateUserDateWithEmail(
                                              context: context,
                                              password: passwordcontroller.text
                                                  .trim(),
                                              birth:
                                                  birthcontroller.text.trim(),
                                              email:
                                                  emailcontroller.text.trim(),
                                              name: namecontroller.text.trim(),
                                              onsucess: () {
                                                CasheHelper.savedata(
                                                    'uid', uid);
                                                slideRightNaviget(
                                                     const Home(), context);
                                              });
                                        } else {
                                          cubit.cerateUserDateWithPhone(
                                              context: context,
                                              birth:
                                                  birthcontroller.text.trim(),
                                              name: namecontroller.text.trim(),
                                              onsucess: () {
                                                CasheHelper.savedata(
                                                    'uid', uid);
                                                navigetandfinsih(
                                                     const Home(), context);
                                              });
                                        }
                                      }
                                    },
                                    size: AppSizes.fullsize(context))
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
          );
        });
  }
}
