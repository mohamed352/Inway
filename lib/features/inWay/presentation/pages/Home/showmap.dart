import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:inway/features/inWay/presentation/constants/color_manger.dart';
import 'package:inway/features/inWay/presentation/constants/sizes_manger.dart';
import 'package:inway/features/inWay/presentation/constants/textstyle_manger.dart';
import 'package:inway/features/inWay/presentation/cubit/inway_cubit.dart';
import 'package:inway/features/inWay/presentation/widgets/mybanner.dart';

class ShowMap extends StatelessWidget {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  ShowMap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InwayCubit, InwayState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = InwayCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: cubit.listUserDate.isNotEmpty
                ? Stack(
                    children: [
                      GoogleMap(
                        mapType: MapType.normal,
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        zoomControlsEnabled: true,
                        zoomGesturesEnabled: true,
                        initialCameraPosition: cubit.kGooglePlex,
                        onMapCreated: (GoogleMapController controller) {
                          if (!_controller.isCompleted) {
                            _controller.complete(controller);
                            cubit.getCurrentLocation(_controller, context);
                          }
                        },
                      ),
                      Positioned(
                        top: AppSizes.getHight(context, 400),
                        child: Container(
                          width: AppSizes.width(context),
                          height: AppSizes.getHight(context, 360),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 16,
                                  spreadRadius: 0.5,
                                  offset: Offset(0.7, 0.7))
                            ],
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(20),
                              right: Radius.circular(20),
                            ),
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi ${cubit.userDate?.name}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                'Where to?',
                                style: MyTextStyle.meduimBold,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 20),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 6,
                                        spreadRadius: 0.5,
                                        offset: Offset(0.7, 0.7))
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.search,
                                      color: ColorApp.lightblue,
                                      size: 30,
                                    ),
                                    const Text('Search your Location')
                                  ],
                                ),
                              ),
                              const MyBanner(
                                  headText: 'Add Home',
                                  icon: Icons.home,
                                  smallText: 'Your home Adress'),
                              const MyBanner(
                                  headText: 'Add Work',
                                  icon: Icons.work,
                                  smallText: 'Your Office Adress')
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        );
      },
    );
  }
}
