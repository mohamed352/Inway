import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inway/cashe_helper.dart';
import 'package:inway/features/inWay/presentation/constants/color_manger.dart';
import 'package:inway/features/inWay/presentation/constants/image_manger.dart';
import 'package:inway/features/inWay/presentation/constants/navigation_manger.dart';
import 'package:inway/features/inWay/presentation/cubit/inway_cubit.dart';
import 'package:inway/features/inWay/presentation/pages/OnBoarding/onboarding_model.dart';
import 'package:inway/features/inWay/presentation/pages/singup/register.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/onboarding_widget.dart';

// ignore: must_be_immutable
class OnBoarding extends StatelessWidget {
  OnBoarding({super.key});
  LiquidController controller = LiquidController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final pages = [
      OnBoardingScreen(
          model: OnBoardingModel(
              AppImagesAssets.onboarding1,
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic',
              size.height,
              ColorApp.green,
              'Welcome to InWay')),
      OnBoardingScreen(
          model: OnBoardingModel(
              AppImagesAssets.onboarding2,
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic',
              size.height,
              ColorApp.sky,
              'free taxi for 3 weeks')),
      OnBoardingScreen(
          model: OnBoardingModel(
              AppImagesAssets.onboarding3,
              'Lorem Ipsum is simply dummy text of thenknown  ty only five  but also the leap into electronic',
              size.height,
              ColorApp.deepblue,
              'pay online and get recash'))
    ];
    return BlocProvider(
      create: (context) => InwayCubit(),
      child: BlocConsumer<InwayCubit, InwayState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = InwayCubit.get(context);
          return Scaffold(
            body: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                LiquidSwipe(
                  pages: pages,
                  slideIconWidget: cubit.curentpage == 2
                      ? const Column()
                      : const Icon(Icons.arrow_back_ios),
                  enableSideReveal: true,
                  liquidController: controller,
                  fullTransitionValue: 450,
                  onPageChangeCallback: (activePageIndex) =>
                      cubit.changeindactor(activePageIndex),
                  enableLoop: false,
                ),
                Positioned(
                    bottom: 25,
                    child: AnimatedSmoothIndicator(
                      activeIndex: controller.currentPage,
                      count: 3,
                      effect: const WormEffect(
                          dotHeight: 10, spacing: 8, radius: 15),
                    )),
                if (cubit.curentpage == 2)
                  Positioned(
                      bottom: 45,
                      right: 30,
                      child: FloatingActionButton(
                        onPressed: () {
                          cubit.onboarding = true;
                          CasheHelper.savedata('onboarding', cubit.onboarding).then((value) {
                            return slideRightNaviget(const RegisterScreen(), context);
                          });
                        },
                        child: const Icon(Icons.arrow_forward_ios),
                      ))
              ],
            ),
          );
        },
      ),
    );
  }
}
