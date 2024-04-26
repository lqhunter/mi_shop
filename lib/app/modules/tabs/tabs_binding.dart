import 'package:get/get.dart';
import 'package:mi_shop/app/modules/home/controllers/home_controller.dart';
import 'package:mi_shop/app/modules/tabs/tabs_controller.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => TabsController(),
    );
    Get.lazyPut(
      () => HomeController(),
    );
  }
}
