import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inway/features/inWay/presentation/constants/image_manger.dart';
import 'package:inway/features/inWay/presentation/constants/sizes_manger.dart';
import 'package:inway/features/inWay/presentation/constants/textstyle_manger.dart';
import 'package:inway/features/inWay/presentation/cubit/inway_cubit.dart';
import 'package:inway/features/inWay/presentation/widgets/itemforimage.dart';

class Serives extends StatelessWidget {
  const Serives({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InwayCubit, InwayState>(
      listener: (context, state) {},
      builder: (context, state) {
        // var cubit = InwayCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Services',
                  style: MyTextStyle.styleBold.copyWith(fontSize: 35),
                ),
              ),
              Text(
                'Go anywhere,get anything',
                style: MyTextStyle.meduimBold,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    const ItemForImage(
                        text: 'Ride', image: AppImagesAssets.car),
                    SizedBox(
                      width: AppSizes.getWidth(context, 15),
                    ),
                    const ItemForImage(
                      text: 'Travel',
                      image: AppImagesAssets.bag,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
