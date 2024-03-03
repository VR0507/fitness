import 'package:fitness/controllers/home_controller.dart';
import 'package:fitness/main.dart';
import 'package:fitness/views/view/onboarding_screens/gym_list_screen.dart';
import 'package:fitness/views/widgets/custom_text.dart';
import 'package:fitness/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends ShyWidget {
  final homeController = Get.put(HomeController());
  GoogleMapController? mapController;

  @override
  Widget buildingView(BuildContext context, double h, double w) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if(homeController.markers.values.isNotEmpty&&mapController!=null) {
          mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: homeController.markers.values.last.position)));
        }
        return Container(
          width: w,
          height: h,
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  controller: homeController.currentAddress,
                  inputType: TextInputType.text,
                  titleText: '',
                  readOnly: true,
                ),
                CustomText(text: "Fitness location for you", fontSize: 20, textColor: Colors.black),
                Row(
                  children: List.generate(
                      homeController.gymListModel.value.data?.length ?? 0,
                      (index) => Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage("${homeController.gymListModel.value.data?[index].imgPath ?? ''}/${homeController.gymListModel.value.data?[index].gymLogo ?? ''}"),
                                radius: 30,
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: 200,
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                color: Colors.grey.shade400,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      child: Image.network("${homeController.gymListModel.value.data?[index].imgPath ?? ''}/${homeController.gymListModel.value.data?[index].gymLogo ?? ''}"),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CustomText(text: homeController.gymListModel.value.data?[index].gymName ?? '', fontSize: 15, textColor: Colors.black)
                                  ],
                                ),
                              )
                            ],
                          )),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(text: "Activities for you", fontSize: 20, textColor: Colors.black),
                Container(
                  width: w,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          homeController.categoryListModel.value.data?.length ?? 0,
                          (index) => GestureDetector(
                                onTap: () {
                                  homeController.hitGymListByCategoryApi(homeController.categoryListModel.value.data?[index].id ?? 0);
                                  Get.to(GymListScreen());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage("${homeController.categoryListModel.value.data?[index].icon ?? ''}"),
                                        radius: 30,
                                      ),
                                      SizedBox(height: 10),
                                      CustomText(text: homeController.categoryListModel.value.data?[index].name ?? '', fontSize: 15, textColor: Colors.black)
                                    ],
                                  ),
                                ),
                              )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(text: "Around you", fontSize: 20, textColor: Colors.black),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: h * 0.5,
                  width: w,
                  child: GoogleMap(
                    scrollGesturesEnabled: true,
                    zoomControlsEnabled: true,
                    zoomGesturesEnabled: true,
                    mapType: MapType.hybrid,
                    initialCameraPosition: homeController.kGooglePlex,
                    markers: Set<Marker>.of(homeController.markers.values),
                    mapToolbarEnabled: true,
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;
                    },
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
