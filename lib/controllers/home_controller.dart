import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/models/category_list_model.dart';
import 'package:fitness/models/gym_list_by_category_model.dart';
import 'package:fitness/models/gym_list_model.dart';
import 'package:fitness/services/api_conts.dart';
import 'package:fitness/services/baseClient.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utils/helpers/shared_pref.dart';

class HomeController extends GetxController {
  final TextEditingController currentAddress = TextEditingController();
  Position? currentPosition;
  var categoryListModel = CategoryListModel().obs;
  var gymListModel = GymListModel().obs;
  var gymListByCategoryModel = GymListByCategoryModel().obs;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{}.obs;

  CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(20.5937, 78.9629),
    zoom: 4,
  );

  @override
  void onInit() {
    super.onInit();
    determinePosition();
    hitCategoryApi();
  }

  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    } else {
      currentPosition = await Geolocator.getCurrentPosition();
      print("lat==>${currentPosition!.latitude} \n long==> ${currentPosition!.longitude}");
      hitGymListApi();
      List<Placemark> placemarks = await placemarkFromCoordinates(currentPosition!.latitude, currentPosition!.longitude);
      Placemark place = placemarks.first;
      currentAddress.text = "${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}";
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  Future<bool> signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      await SharedPref.setBool(key: "login", data: false);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  void hitCategoryApi() async {
    Map req = {};
    req["user_id"] = 1;
    CategoryListModel model = CategoryListModel.fromJson(await BaseClient().post(ApiConst.getCategoryList, req));
    print("length==>${model.data?.length}");
    categoryListModel(model);
  }

  void hitGymListApi() async {
    Map req = {};
    req["latitude"] = currentPosition!.latitude;
    req["longitude"] = currentPosition!.longitude;
    GymListModel model = GymListModel.fromJson(await BaseClient().post(ApiConst.getGymList, req));
    model.data?.forEach((element) {
      markers.assign(MarkerId(element.gymName??''), Marker(markerId: MarkerId(element.gymName??''),position: LatLng(double.parse(element.latitude??''), double.parse(element.longitude??''))));
    });
    
    gymListModel(model);
  }

  void hitGymListByCategoryApi(int id) async {
    Map req = {};
    req["category_id"] = id;
    GymListByCategoryModel model = GymListByCategoryModel.fromJson(await BaseClient().post(ApiConst.getGymListByCategory, req));
    gymListByCategoryModel(model);
  }
}
