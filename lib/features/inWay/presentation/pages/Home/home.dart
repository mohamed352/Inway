import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inway/features/inWay/presentation/constants/theam_manger.dart';
import 'package:inway/features/inWay/presentation/cubit/inway_cubit.dart';
import 'package:inway/features/inWay/presentation/widgets/loading.dart';

class Home extends StatelessWidget {
const  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InwayCubit, InwayState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = InwayCubit.get(context);
        return AnnotatedRegion(
          value: lightStatusBar,
          child: SafeArea(
            child: Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                  enableFeedback: true,
                  items: cubit.item,
                  currentIndex: cubit.index,
                  onTap: (index) {
                    cubit.changeIndex(index);
                  },
                ),
                backgroundColor: Colors.white,
                body: LoadingAnimation(
                  conditionToLoading: cubit.listUserDate.isEmpty,
                  widget: IndexedStack(
                    index: cubit.index,
                    children: cubit.screen,
                  ),
                )),
          ),
        );
      },
    );
  }
}
