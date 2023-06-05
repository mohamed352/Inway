import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inway/features/inWay/data/models/userdate.dart';
import 'package:inway/features/inWay/presentation/constants/navigation_manger.dart';
import 'package:inway/features/inWay/presentation/constants/textstyle_manger.dart';
import 'package:inway/features/inWay/presentation/cubit/inway_cubit.dart';
import 'package:inway/features/inWay/presentation/pages/setting/editpage.dart';
import 'package:inway/features/inWay/presentation/pages/singup/cubit/register_cubit.dart';
import 'package:inway/features/inWay/presentation/widgets/divider.dart';
import 'package:inway/features/inWay/presentation/widgets/fromattime.dart';

import '../../constants/sizes_manger.dart';
import '../../widgets/elvatetdbutton.dart';

class EditProfile extends StatelessWidget {
  final ScrollController _controller =
      ScrollController(initialScrollOffset: 15);

  EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InwayCubit, InwayState>(
      listener: (context, state) {},
      builder: (context, state) {
        FocusNode focusNode = FocusNode();
        var cubit = InwayCubit.get(context);
        var model = cubit.userDate;
        File? profileimage = cubit.profileImage;
        SystemUiOverlayStyle current = SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light);
        return AnnotatedRegion(
          value: current,
          child: SafeArea(
            child: Scaffold(
                body: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) => CustomScrollView(
                controller: _controller,
                slivers: [
                  SliverAppBar(
                    expandedHeight: 100,
                    pinned: true,
                    elevation: 0,
                    backgroundColor: Colors.black,
                    flexibleSpace: FlexibleSpaceBar(
                      title: const Text(
                        'Edit Account',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      titlePadding: EdgeInsets.only(
                          left: _controller.positions.isNotEmpty &&
                                  _controller.offset.toDouble() > 15
                              ? _controller.offset + 5
                              : 15,
                          bottom: 15),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (state is UploadProfileImageLoading)
                          const LinearProgressIndicator(
                            color: Colors.black,
                            backgroundColor: Colors.white,
                          ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 10, bottom: 25),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  cubit.pickProfileImage(context);
                                },
                                child: Stack(
                                  alignment: Alignment.bottomLeft,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      backgroundImage: profileimage != null
                                          ? FileImage(profileimage)
                                              as ImageProvider
                                          : NetworkImage('${model?.image}'),
                                      radius: 55,
                                    ),
                                    const CircleAvatar(
                                      radius: 17,
                                      backgroundColor: Colors.black,
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: 22,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Spacer(),
                              if (profileimage != null)
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: MyElvatedButton(
                                      text: 'Upload',
                                      color: Colors.black,
                                      onPressed: () {
                                        cubit.uploadImageProfile(context);
                                      },
                                      size: AppSizes.customsize(
                                          0.14, 0.05, context)),
                                ),
                            ],
                          ),
                        ),
                        MyDivider(
                          inch: 1,
                          color: Colors.grey.shade300,
                          isHight: false,
                          marginDawon: 10,
                        ),
                        EditProfileItem(
                          model: model,
                          capitonText: 'Frist name',
                          function: () {
                            navigatioonalign(
                                EditPage(
                                  focusNode: focusNode,
                                  controllerText: model!.name!,
                                  text: 'Frist name',
                                  textInputType: TextInputType.name,
                                ),
                                context);
                          },
                          modelText: '${model?.name}',
                        ),
                        EditProfileItem(
                          model: model,
                          capitonText: 'birthDate',
                          function: () {
                            navigatioonalign(
                                EditPage(
                                  focusNode: focusNode,
                                  controllerText: model!.birthdate!,
                                  text: 'birthDate',
                                  textInputType: TextInputType.datetime,
                                ),
                                context);
                          },
                          modelText: '${model?.birthdate}',
                        ),
                        if (model?.phone != null)
                          EditProfileItem(
                            model: model,
                            capitonText: 'Phone Number',
                            function: () {
                              navigatioonalign(
                                  EditPage(
                                    focusNode: focusNode,
                                    controllerText: model!.phone!,
                                    text: 'Phone Number',
                                    textInputType: TextInputType.phone,
                                    isPhone: true,
                                  ),
                                  context);
                            },
                            modelText: '${model?.phone}',
                            isEmail: false,
                            iconData: Icons.phone_android,
                          ),
                        if (model?.email != null)
                          EditProfileItem(
                            model: model,
                            capitonText: 'Email',
                            function: () {
                              navigatioonalign(
                                  EditPage(
                                    focusNode: focusNode,
                                    controllerText: model!.email!,
                                    text: 'Email',
                                    textInputType: TextInputType.emailAddress,
                                  ),
                                  context);
                            },
                            modelText: '${model?.email}',
                            isEmail: true,
                          ),
                        EditProfileItem(
                            model: model,
                            capitonText: 'Active time',
                            function: () {},
                            modelText:
                                'this Account active day ${getTimeDifferenceFromNow(model?.dateTime.toDate(), true)}'),
                        const ConnectWithSocial(
                          color: Colors.red,
                          iconData: FontAwesomeIcons.google,
                          text: 'Google',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const ConnectWithSocial(
                          color: Colors.blue,
                          iconData: FontAwesomeIcons.facebook,
                          text: 'Facebook',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
          ),
        );
      },
    );
  }
}

class ConnectWithSocial extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color color;
  const ConnectWithSocial(
      {super.key,
      required this.iconData,
      required this.text,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FaIcon(
            iconData,
            color: color,
            size: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Spacer(),
          Text(
            'unConnected',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.redAccent),
          ),
        ],
      ),
    );
  }
}

class EditProfileItem extends StatelessWidget {
  final String capitonText;
  final String modelText;

  final Function function;
  final IconData? iconData;
  final bool? isEmail;

  const EditProfileItem(
      {super.key,
      required this.model,
      required this.capitonText,
      this.isEmail,
      required this.modelText,
      required this.function,
      this.iconData});

  final UserDate? model;

  @override
  Widget build(BuildContext context) {
    var cubit = RegisterCubit.get(context);
    return InkWell(
      onTap: () {
        function();
      },
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              capitonText,
              style: MyTextStyle.bigCapiton,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isEmail != null && isEmail == false
                        ? '${cubit.country.flagEmoji} + ${cubit.country.phoneCode}$modelText'
                        : modelText,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  if (isEmail != null)
                    Text(
                      'Verified',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.green),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
