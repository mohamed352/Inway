import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inway/features/inWay/presentation/constants/navigation_manger.dart';
import 'package:inway/features/inWay/presentation/constants/sizes_manger.dart';
import 'package:inway/features/inWay/presentation/constants/textstyle_manger.dart';
import 'package:inway/features/inWay/presentation/cubit/inway_cubit.dart';
import 'package:inway/features/inWay/presentation/pages/setting/setting.dart';
import 'package:inway/features/inWay/presentation/widgets/divider.dart';
import 'package:inway/features/inWay/presentation/widgets/itembar.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InwayCubit, InwayState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = InwayCubit.get(context);
        var model = cubit.userDate;

        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '${model?.name}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: MyTextStyle.styleBold,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage('${model?.image}'),
                  ),
                ],
              ),
              Container(
                width: AppSizes.getWidth(context, 80),
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '5.0',
                      style: MyTextStyle.meduimBold,
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Item(
                      icon: Icons.support,
                      text: 'Help',
                    ),
                    Item(
                      icon: Icons.wallet,
                      text: 'Wallet',
                      padding: 10,
                    ),
                    Item(icon: FontAwesomeIcons.solidClock, text: 'Trips')
                  ],
                ),
              ),
              MyDivider(
                isHight: false,
                inch: 10,
                color: Colors.grey.shade200,
                marginDawon: 15,
              ),
              ItemBar(
                function: () {},
                iconData: Icons.email,
                showDivider: true,
                text: 'Messages',
              ),
              ItemBar(
                  iconData: Icons.settings,
                  text: 'Settings',
                  showDivider: true,
                  function: () {
                    navigatioonalign(const SettingScreen(), context);
                  }),
              ItemBar(
                function: () {},
                iconData: Icons.info,
                text: 'Legal',
                showDivider: true,
              ),
            ],
          ),
        );
      },
    );
  }
}

class Item extends StatelessWidget {
  final IconData icon;
  final String text;
  final double? padding;
  const Item({super.key, required this.icon, required this.text, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.getWidth(context, 105),
      margin: EdgeInsets.symmetric(horizontal: padding ?? 0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 30,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: MyTextStyle.meduimBold,
          )
        ],
      ),
    );
  }
}
