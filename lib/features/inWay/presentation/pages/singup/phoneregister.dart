import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inway/features/inWay/presentation/constants/color_manger.dart';
import 'package:inway/features/inWay/presentation/constants/image_manger.dart';
import 'package:inway/features/inWay/presentation/constants/sizes_manger.dart';
import 'package:inway/features/inWay/presentation/constants/textstyle_manger.dart';
import 'package:inway/features/inWay/presentation/constants/theam_manger.dart';
import 'package:inway/features/inWay/presentation/pages/singup/cubit/register_cubit.dart';
import 'package:inway/features/inWay/presentation/widgets/elvatetdbutton.dart';
import 'package:inway/features/inWay/presentation/widgets/hellinetext.dart';
import 'package:inway/features/inWay/presentation/widgets/loading.dart';
import 'package:inway/features/inWay/presentation/widgets/textfromfield.dart';

class PhoneAuth extends StatelessWidget {
  final TextEditingController phonecontroller = TextEditingController();
  PhoneAuth({super.key});

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
                  conditionToLoading: state is SendPhoneCodeLoading,
                  widget: ListView.builder(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(AppImagesAssets.phoneAuth),
                          const HeadLineText(
                              bigtext: 'Register',
                              smaltext:
                                  "Add your phone number, We'll send a verifiction code"),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: MyTextFromField(
                              controller: phonecontroller,
                              textInputType: TextInputType.phone,
                              color: ColorApp.lightblue.withOpacity(0.1),
                              hinttext: 'Enter phone number',
                              onChange: (value) {
                                if (phonecontroller.text.length < 12) {
                                  cubit.phoneDone(phonecontroller.text, value);
                                }
                              },
                              perfixicon: PerifxIconForPhone(cubit: cubit),
                              
                              suifxicon: phonecontroller.text.length > 10
                                  ? CircleAvatar(
                                      backgroundColor: ColorApp.lightblue,
                                      radius: 15,
                                      child: const Icon(
                                        Icons.done,
                                        color: Colors.white,
                                        size: 22,
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                          MyElvatedButton(
                              text: 'Login',
                              color: ColorApp.lightblue,
                              onPressed: () {
                                if (phonecontroller.text.trim().length > 10) {
                                  final String phonenumber =
                                      phonecontroller.text.trim();

                                  cubit.singinWithPhone(context,
                                      "+${cubit.country.phoneCode}$phonenumber");
                                }
                              },
                              size: AppSizes.fullsize(context))
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

class PerifxIconForPhone extends StatelessWidget {
  const PerifxIconForPhone({
    super.key,
    required this.cubit,
  });

  final RegisterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: InkWell(
          onTap: () {
            showCountryPicker(
              context: context,
              countryListTheme: CountryListThemeData(
                  bottomSheetHeight:
                      AppSizes.height(context) * 0.6),
              onSelect: (value) {
                cubit.selectcountry(value);
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(3),
            child:
             Text(
                '${cubit.country.flagEmoji} + ${cubit.country.phoneCode}',
                style: MyTextStyle.meduimBold),
          )),
    );
  }
}
