import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inway/features/inWay/presentation/cubit/inway_cubit.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InwayCubit, InwayState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        return SafeArea(child: Scaffold(body:Column() ,));
      },
    );
  }
}
