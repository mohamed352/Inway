import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:inway/features/inWay/presentation/constants/image_manger.dart';
import 'package:inway/features/inWay/presentation/constants/navigation_manger.dart';
import 'package:inway/features/inWay/presentation/constants/sizes_manger.dart';
import 'package:inway/features/inWay/presentation/constants/textstyle_manger.dart';
import 'package:inway/features/inWay/presentation/cubit/inway_cubit.dart';
import 'package:inway/features/inWay/presentation/pages/Home/showmap.dart';
import 'package:inway/features/inWay/presentation/widgets/itemforimage.dart';
import 'package:inway/features/inWay/presentation/widgets/mytextbutton.dart';
import 'package:inway/features/inWay/presentation/widgets/search_inhome.dart';

class HomeScreen extends StatelessWidget {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InwayCubit, InwayState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = InwayCubit.get(context);
        return ListView.builder(
          itemCount: 1,
          padding: const EdgeInsets.all(8),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchLocation(),
              Row(
                children: [
                  Text(
                    'Suggestions',
                    style: MyTextStyle.styleBold,
                  ),
                  const Spacer(),
                  MyTextButton(
                      text: 'See All',
                      ontap: () {},
                      textStyle: MyTextStyle.meduimBold.copyWith(fontSize: 14),
                      paddinghorizontal: 0,
                      paddingvertical: 0)
                ],
              ),
              Row(
                children: [
                  const ItemForImage(text: 'Ride', image: AppImagesAssets.car),
                  SizedBox(
                    width: AppSizes.getWidth(context, 15),
                  ),
                  const ItemForImage(
                    text: 'Travel',
                    image: AppImagesAssets.bag,
                  )
                ],
              ),
              Text(
                'More ways to use Inway',
                style: MyTextStyle.styleBold,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: AppSizes.getHight(context, 150),
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => const ItemForList(),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                      itemCount: 10),
                ),
              ),
              Text(
                'Around you',
                style: MyTextStyle.styleBold,
              ),
              InkWell(
                onTap: () {
                  navigatioonalign(ShowMap(), context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: GoogleMap(
                        initialCameraPosition: cubit.kGooglePlex,
                        compassEnabled: false,
                        myLocationEnabled: true,
                        myLocationButtonEnabled: false,
                        mapType: MapType.normal,
                        padding: const EdgeInsets.only(top: 200),
                        onMapCreated: (GoogleMapController controller) {
                          if (!_controller.isCompleted) {
                            _controller.complete(controller);
                            cubit.getCurrentLocation(_controller, context);
                          }
                        },
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class ItemForList extends StatelessWidget {
  const ItemForList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  isAntiAlias: true,
                  image: AssetImage(AppImagesAssets.lock))),
        ),
        Row(
          children: [
            Text(
              'Travel inter',
              style: MyTextStyle.meduimBold,
            ),
            const Icon(Icons.arrow_right)
          ],
        ),
        Text(
          'Go inwsiknsk withe ease',
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }
}
