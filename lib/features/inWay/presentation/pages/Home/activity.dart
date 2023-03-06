import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inway/features/inWay/presentation/constants/textstyle_manger.dart';
import 'package:inway/features/inWay/presentation/constants/theam_manger.dart';
import 'package:inway/features/inWay/presentation/cubit/inway_cubit.dart';

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InwayCubit, InwayState>(
      listener: (context, state) {},
      builder: (context, state) {
        //  var cubit = InwayCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Activity',
                        style: MyTextStyle.styleBold.copyWith(fontSize: 35),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Past',
                          style: MyTextStyle.meduimBold,
                        ),
                        const Spacer(),
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.grey.shade200,
                          child: const Icon(
                            Icons.settings,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    Text(
                      'You don' '\'t have any activity',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ]),
            ),
          ),
        );
      },
    );
  }
}
