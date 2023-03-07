import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inway/features/inWay/presentation/constants/sizes_manger.dart';
import 'package:inway/features/inWay/presentation/constants/textstyle_manger.dart';
import 'package:inway/features/inWay/presentation/cubit/inway_cubit.dart';
import 'package:inway/features/inWay/presentation/widgets/divider.dart';
import 'package:inway/features/inWay/presentation/widgets/elvatetdbutton.dart';

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InwayCubit, InwayState>(
      listener: (context, state) {},
      builder: (context, state) {
    //    var cubit = InwayCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                InkWell(
                  onTap: () {
                    modelBottomSheetActivity(
                      context,
                    );
                  },
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.grey.shade200,
                    child: const Icon(
                      Icons.settings,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            Text(
              'You don' '\'t have any activity',
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ]),
        );
      },
    );
  }
}

dynamic modelBottomSheetActivity(
  context,
) {
  return showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    builder: (context) {
      var cubit = InwayCubit.get(context);
      return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 15),
        height: AppSizes.getHight(context, 260),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(
              'Filterd by...',
              style: MyTextStyle.meduimBold,
            )),
            MyDivider(
              inch: 1,
              color: Colors.grey.shade400,
              isHight: false,
              marginTop: 20,
              marginDawon: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Services',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Item(
                        text: 'All',
                        function: () {
                          cubit.changeColorActivity(
                              text: 'All', retext1: 'Rides', retext2: 'Eats');
                        },
                      ),
                      Item(
                        text: 'Rides',
                        function: () {
                          cubit.changeColorActivity(
                              text: 'Rides', retext1: 'All', retext2: 'Eats');
                        },
                      ),
                      Item(
                        text: 'Eats',
                        function: () {
                          cubit.changeColorActivity(
                              text: 'Eats', retext1: 'All', retext2: 'Rides');
                        },
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: MyElvatedButton(
                        text: 'Apply',
                        color: Colors.black,
                        onPressed: () {},
                        size: AppSizes.fullsize(context)),
                  )
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}

class Item extends StatelessWidget {
  final String text;
  final Function function;

  const Item({
    super.key,
    required this.text,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = InwayCubit.get(context);
    return InkWell(
      onTap: () {
        function();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
            color: cubit.activityColor.contains(text)
                ? Colors.black
                : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: cubit.activityColor.contains(text)
                  ? Colors.white
                  : Colors.black),
        ),
      ),
    );
  }
}
