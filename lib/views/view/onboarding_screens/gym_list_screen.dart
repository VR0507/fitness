import 'package:fitness/controllers/home_controller.dart';
import 'package:fitness/main.dart';
import 'package:fitness/views/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GymListScreen extends ShyWidget {
  final controller = Get.put(HomeController());

  GymListScreen({super.key});

  @override
  Widget buildingView(BuildContext context, double h, double w) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(children: [
            ListView.builder(
              itemCount: controller.gymListByCategoryModel.value.data?.length ?? 0,
              shrinkWrap: true,
              itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    width: w,
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          child: Image.network(
                            "${controller.gymListByCategoryModel.value.data?[index].imgPath ?? ''}/${controller.gymListByCategoryModel.value.data?[index].gymLogo ?? ''}",
                            errorBuilder: (context, error, stackTrace) => const CustomText(text: "Unable to load", fontSize: 10, textColor: Colors.black),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: controller.gymListByCategoryModel.value.data?[index].gymName ?? '', fontSize: 18, textColor: Colors.black, fontWeight: FontWeight.bold),
                            Row(
                              children: [
                                Icon(CupertinoIcons.location_solid, color: Colors.white.withOpacity(0.7), size: 20),
                                CustomText(text: controller.gymListByCategoryModel.value.data?[index].address ?? '', fontSize: 15, textColor: Colors.black, maxLines: 5)
                              ],
                            ),
                            Row(
                              children: [
                                Icon(CupertinoIcons.clock_fill, color: Colors.white.withOpacity(0.7), size: 20),
                                CustomText(text: controller.gymListByCategoryModel.value.data?[index].open ?? '', fontSize: 15, textColor: Colors.black, maxLines: 5)
                              ],
                            ),
                            Row(
                              children: [
                                Icon(CupertinoIcons.star_fill, color: Colors.white.withOpacity(0.7), size: 20),
                                CustomText(text: controller.gymListByCategoryModel.value.data?[index].rating ?? '', fontSize: 15, textColor: Colors.black, maxLines: 5)
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: w,
                    height: 50,
                    child: ListView.builder(
                      itemCount: controller.gymListByCategoryModel.value.data?[index].categories?.length ?? 0,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, innerIndex) => Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(color: Colors.grey.shade400, borderRadius: BorderRadius.circular(20)),
                        child: CustomText(text: controller.gymListByCategoryModel.value.data?[index].categories?[innerIndex].categoryName ?? '', fontSize: 15, textColor: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ]),
        );
      }),
    );
  }
}
