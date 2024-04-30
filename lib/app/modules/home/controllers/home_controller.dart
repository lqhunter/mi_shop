import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mi_shop/app/util/Log.dart';
import 'package:mi_shop/app/util/http_client.dart';

import '../../../model/banner_model.dart';
import '../../../model/best_model.dart';

class HomeController extends GetxController {
  late HttpsClient httpClient;
  late ScrollController scrollController;

  var flag = false.obs;
  var bannerList = <BannerModelResult>[].obs;
  var bestList = <BestModelResult>[].obs;
  var alpha = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    httpClient = HttpsClient();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset <= 100) {
        alpha.value = scrollController.offset / 100; //设置alpha
        flag.value = false;
        update();
      } else {
        flag.value = true;
        update();
      }

    });
  }

  @override
  void onReady() {
    _getBannerData();
    _getBestList();
  }

  void _getBannerData() async {
    await httpClient.get("api/focus").then((value) {
      logger.d(value.data);
      bannerList.value =
          BannerModel.fromJson(value.data).result ?? [];
      update();
    }, onError: (e) => {logger.e(e)});
  }

  void _getBestList() async {
    await httpClient.get("api/plist?is_best=1").then((value) {
      logger.d(value.data);
      bestList.value = BestModel.fromJson(value.data).result ?? [];
      update();
    }, onError: (e) => {logger.e(e)});

  }


}
