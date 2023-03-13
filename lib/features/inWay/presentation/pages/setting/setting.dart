import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inway/features/inWay/data/models/userdate.dart';
import 'package:inway/features/inWay/presentation/constants/navigation_manger.dart';
import 'package:inway/features/inWay/presentation/constants/sizes_manger.dart';
import 'package:inway/features/inWay/presentation/constants/textstyle_manger.dart';
import 'package:inway/features/inWay/presentation/cubit/inway_cubit.dart';
import 'package:inway/features/inWay/presentation/pages/setting/editprofile.dart';
import 'package:inway/features/inWay/presentation/pages/singup/register.dart';
import 'package:inway/features/inWay/presentation/widgets/divider.dart';
import 'package:inway/features/inWay/presentation/widgets/itembar.dart';
import 'package:inway/features/inWay/presentation/widgets/mytextbutton.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InwayCubit, InwayState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = InwayCubit.get(context);
        var model = cubit.userDate;
        return SafeArea(
          child: Scaffold(
              body: ListView.builder(
            itemCount: 1,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.close,
                      size: 35,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    'Settings',
                    style: MyTextStyle.styleBold.copyWith(fontSize: 35),
                  ),
                ),
                RowProfile(model: model),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var item in itemBar) item,
                    ],
                  ),
                ),
                MyDivider(
                    inch: 15,
                    color: Colors.grey.shade200,
                    isHight: false,
                    marginTop: 10),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: MyTextButton(
                      text: 'Sing out',
                      ontap: () {
                        cubit.singOut(context).whenComplete(() =>
                            navigetandfinsih(const RegisterScreen(), context));
                      },
                      textStyle:
                          const TextStyle(color: Colors.red, fontSize: 18),
                      paddinghorizontal: 10,
                      paddingvertical: 15),
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}

class RowProfile extends StatelessWidget {
  const RowProfile({
    super.key,
    required this.model,
  });

  final UserDate? model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        slideRightNaviget(EditProfile(), context);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage('${model?.image}'),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: AppSizes.getWidth(context, 144),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (model?.phone != null)
                    Text(
                      '${model?.phone}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 14),
                    ),
                  if (model?.email != null)
                    Text(
                      '${model?.email}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 14),
                    ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              width: AppSizes.getWidth(context, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, right: 15),
                    child: Text(
                      '${model?.name}',
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List itemBar = [
  ItemBar(
      iconData: Icons.home,
      text: 'Add Home',
      showIcon: true,
      showDivider: true,
      function: () {}),
  ItemBar(
      iconData: Icons.work,
      text: 'Add work',
      showIcon: true,
      showDivider: true,
      function: () {}),
  ItemBar(
      iconData: Icons.lock,
      text: 'Privcy',
      showIcon: true,
      showDivider: true,
      smallText: 'Mange the data you share with us',
      function: () {}),
  ItemBar(
      iconData: Icons.app_shortcut,
      text: 'Shortcut',
      showIcon: true,
      showDivider: true,
      function: () {}),
  ItemBar(
      iconData: Icons.security,
      text: 'Security',
      showIcon: true,
      showDivider: true,
      smallText: 'Control your account security with 2-step verifications',
      function: () {}),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      'Saftey',
      style: MyTextStyle.styleBold.copyWith(fontSize: 25),
    ),
  ),
  ItemBar(
      iconData: Icons.check_box,
      text: 'RideCheck',
      showIcon: true,
      showDivider: true,
      smallText: 'Mange your ride check notification',
      function: () {}),
  ItemBar(
      iconData: Icons.security,
      text: 'Mange Trusted contacts',
      showIcon: true,
      showDivider: true,
      smallText:
          'Sahre your trip status with family and frindes with in a single tap',
      function: () {}),
];
