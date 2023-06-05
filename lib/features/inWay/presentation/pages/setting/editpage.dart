import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inway/features/inWay/presentation/pages/singup/cubit/register_cubit.dart';
import 'package:inway/features/inWay/presentation/pages/singup/phoneregister.dart';
import 'package:inway/features/inWay/presentation/widgets/divider.dart';
import 'package:inway/features/inWay/presentation/widgets/elvatetdbutton.dart';

import '../../constants/sizes_manger.dart';
import '../../constants/textstyle_manger.dart';
import '../../cubit/inway_cubit.dart';

class EditPage extends StatelessWidget {
  final String text;
  final String controllerText;
  final TextInputType textInputType;
  final bool? isPhone;

  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode;
  EditPage({
    super.key,
    required this.focusNode,
    required this.controllerText,
    required this.text,
    required this.textInputType,
    this.isPhone,
  });

  @override
  Widget build(BuildContext context) {
    controller.text = controllerText;
    return BlocConsumer<InwayCubit, InwayState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = InwayCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (state is EditProfileLoading)
                    const LinearProgressIndicator(
                      color: Colors.black,
                      backgroundColor: Colors.white,
                    ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_back,
                        size: 25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      text,
                      style: MyTextStyle.bigCapiton,
                    ),
                  ),
                  TextFormField(
                    controller: controller,
                    showCursor: true,
                    autofocus: true,
                    textDirection: TextDirection.ltr,
                    focusNode: focusNode,
                    style:
                        isPhone != null ? const TextStyle(height: 2.2) : null,
                    cursorHeight: 25,
                    textAlign: TextAlign.left,
                    keyboardType: textInputType,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 5),
                        prefixIcon: isPhone != null
                            ? PerifxIconForPhone(
                                cubit: RegisterCubit.get(context))
                            : null),
                  ),
                  const MyDivider(
                    inch: 2,
                    color: Colors.black,
                    isHight: false,
                    marginDawon: 40,
                  ),
                  MyElvatedButton(
                    color: Colors.black,
                    onPressed: () {
                      if (isPhone != null) {
                        cubit.udateProfile(
                            context: context, phone: controller.text.trim());
                      } else if (text == 'Frist name') {
                        cubit.udateProfile(
                            context: context, name: controller.text.trim());
                      } else if (textInputType == TextInputType.datetime) {
                        cubit.udateProfile(
                            context: context,
                            birthdate: controller.text.trim());
                      } else {
                        cubit.udateProfile(
                            context: context, email: controller.text.trim());
                      }
                    },
                    size: AppSizes.fullsize(context),
                    text: 'Save',
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
