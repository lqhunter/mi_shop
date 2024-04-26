import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mi_shop/app/modules/home/views/home_view.dart';

import '../category/category_view.dart';
import '../service/service_view.dart';
import '../cart/cart_view.dart';
import '../user/user_view.dart';

class TabsController extends GetxController {
  final List<Widget> tabs = [
    const HomeView(),
    const CategoryView(),
    const ServiceView(),
    const CartView(),
    const UserView(),
  ];

  final _currentIndex = 0.obs;
  PageController pageController = PageController(initialPage: 0);

  int getCurrentIndex() => _currentIndex.value;

  void setCurrentIndex(int value) {
    _currentIndex.value = value;
    update();
  }
}