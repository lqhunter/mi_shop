import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_shop/app/modules/tabs/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: PageView(
            controller: controller.pageController,
            children: controller.tabs,
            onPageChanged: (index) {
              controller.setCurrentIndex(index);
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.red,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
              BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.room_service), label: "服务"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "购物车"),
              BottomNavigationBarItem(icon: Icon(Icons.people), label: "用户")
            ],
            currentIndex: controller.getCurrentIndex(),
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              controller.setCurrentIndex(index);
              controller.pageController.jumpToPage(index);
            },
          ),
        ));
  }
}
