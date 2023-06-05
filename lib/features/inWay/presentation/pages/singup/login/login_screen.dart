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
import 'package:inway/features/inWay/presentation/pages/singup/forgetpassword.dart';
import 'package:inway/features/inWay/presentation/pages/singup/singup.dart';
import 'package:inway/features/inWay/presentation/widgets/animation_text.dart';
import 'package:inway/features/inWay/presentation/widgets/elvatetdbutton.dart';
import 'package:inway/features/inWay/presentation/widgets/loading.dart';
import 'package:inway/features/inWay/presentation/widgets/mytextbutton.dart';
import 'package:inway/features/inWay/presentation/widgets/register_splach.dart';
import 'package:inway/features/inWay/presentation/widgets/register_splach2.dart';
import 'package:inway/features/inWay/presentation/widgets/textfromfield.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fromkey = GlobalKey<FormState>();
    final dataBloc = BlocProvider.of<RegisterCubit>(context);
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
                        state is SingInWithEmailandPasswordLoading,
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
                                  TyperAnimatedText('Welcome',
                                      speed: const Duration(milliseconds: 300),
                                      curve: Curves.linearToEaseOut),
                                ],
                              ),
                              animationtext2: AnimationText(
                                textStyle: MyTextStyle.animationstyle,
                                listtext: [
                                  TypewriterAnimatedText('Back',
                                      speed: const Duration(milliseconds: 2000),
                                      curve: Curves.linearToEaseOut),
                                ],
                              ),
                            ),
                            RegisterSplach2(
                                widget: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: MyTextFromField(
                                      controller: emailcontroller,
                                      textInputType: TextInputType.emailAddress,
                                      lapletext: 'Email or username',
                                      color: ColorApp.lightblue.withOpacity(
                                        0.1,
                                      ),
                                      perfixicon: Icon(
                                        Icons.email,
                                        color: ColorApp.lightblue,
                                      ),
                                      validate: (String value) =>
                                          vildateemail(value)),
                                ),
                                MyTextFromField(
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
                                        vildate(value, 'Password')),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: AppSizes.width(context) * 0.57),
                                    child: MyTextButton(
                                      text: 'Forget password?',
                                      ontap: () {
                                        navigatioonalign(
                                            ForgetPassword(), context);
                                      },
                                      paddinghorizontal: 0,
                                      paddingvertical: 20,
                                    )),
                                SizedBox(
                                  height: AppSizes.height(context) * 0.13,
                                ),
                                MyElvatedButton(
                                    text: 'Sing in',
                                    size: AppSizes.fullsize(context),
                                    color: ColorApp.lightblue,
                                    onPressed: () {
                                      if (fromkey.currentState!.validate()) {
                                        cubit.singInWithEmailandPassword(
                                            context: context,
                                            email: emailcontroller.text.trim(),
                                            password:
                                                passwordcontroller.text.trim(),
                                            onSucess: () {
                                              CasheHelper.savedata('uid', uid);
                                              slideLeftNaviget(const Home(), context);
                                            });
                                      }
                                    }),
                                SizedBox(
                                  width: AppSizes.width(context) * 0.6,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Don' '\'t have an account?',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      MyTextButton(
                                        text: 'Sing up',
                                        ontap: () {
                                          navigatioonalign(
                                              Singup(
                                                userSingUpWithPhone: false,
                                              ),
                                              context);
                                        },
                                        paddinghorizontal: 2,
                                        paddingvertical: 10,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                  ))),
        );
      },
      bloc: dataBloc,
    );
  }
}
