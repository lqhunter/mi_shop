import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:mi_shop/app/util/my_fonts.dart';

import '../../../util/http_client.dart';
import '../../../util/screen_adapter.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeContent(controller: controller);
  }
}

class HomeContent extends StatelessWidget {
  final HomeController controller;

  const HomeContent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: _appBar(),
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            HomeBanner(controller: controller),
          ],
        )));
  }

  AppBar _appBar() {
    return AppBar(
      leading: controller.flag.value
          ? const Text('')
          : const Icon(
              MyFonts.xiaomi,
              color: Colors.red,
            ),
      leadingWidth: controller.flag.value
          ? ScreenAdapter.width(40)
          : ScreenAdapter.width(140),
      title: GestureDetector(
        onTap: () {
          controller.flag.value = !controller.flag.value;
        },
        child: AnimatedContainer(
            width: controller.flag.value
                ? ScreenAdapter.width(800)
                : ScreenAdapter.width(620),
            height: ScreenAdapter.height(96),
            decoration: BoxDecoration(
              color: const Color.fromARGB(230, 252, 243, 236),
              borderRadius: BorderRadius.circular(30),
            ),
            duration: const Duration(milliseconds: 600),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: ScreenAdapter.width(20),
                      right: ScreenAdapter.width(20)),
                  child: const Icon(
                    Icons.search,
                    color: Colors.black38,
                  ),
                ),
                const Text('手机', style: TextStyle(color: Colors.black38)),
              ],
            )),
      ),
      centerTitle: true,
      backgroundColor:
          controller.flag.value ? Colors.white : Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.qr_code,
              color: controller.flag.value ? Colors.black87 : Colors.white,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.message,
                color: controller.flag.value ? Colors.black87 : Colors.white))
      ],
    );
  }
}

class HomeBanner extends StatelessWidget {
  final HomeController controller;

  const HomeBanner({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 682.h,
      child: Obx(() => Swiper(
            itemCount: controller.bannerList.length,
            autoplay: true,
            loop: true,
            pagination: const SwiperPagination(builder: SwiperPagination.rect),
            itemBuilder: (context, index) {
              return Image.network(
                HttpsClient.replaeUri(controller.bannerList[index].pic),
                fit: BoxFit.fill,
              );
            },
          )),
    );
  }
}

class HomeBestList extends StatelessWidget {
  final HomeController controller;

  const HomeBestList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 20.h),
      color: const Color.fromRGBO(246, 246, 246, 1),
      child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 26.w,
          crossAxisSpacing: 20.h,
          itemCount: controller.bestList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {

          }),
    );
  }
}
