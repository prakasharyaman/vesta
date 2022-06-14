import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vesta/constants/constants.dart';
import 'package:vesta/ui/channelPage/channel_page.dart';
import 'package:vesta/ui/hompage/controller/home_controller.dart';
import 'package:vesta/ui/hompage/widgets/category_tab.dart';
import 'package:vesta/ui/hompage/widgets/popular_widget.dart';
import 'package:vesta/ui/hompage/widgets/swiper_widget.dart';

import '../../util/status_enum.dart';
import '../splash/splash.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => Obx(() {
        switch (controller.status.value) {
          case Status.loading:
            return const Splash();
          case Status.loaded:
            var categories = controller.categories;
            var channels = controller.channels;
            var popularChannels = channels.sublist(0, 10);
            var swiperChannels = controller.swiperChannels;
            return Scaffold(
              backgroundColor: ktransparentColor,
              body: RefreshIndicator(
                color: const Color(0xFF5C258D),
                onRefresh: () {
                  controller.getData();
                  return Future.delayed(const Duration(seconds: 1));
                },
                child: Stack(
                  children: [
                    ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        // categories tabs
                        SizedBox(
                          height: height * 0.08,
                          width: width,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 8.0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: categories.length,
                              itemBuilder: (_, index) {
                                return CategoryTab(category: categories[index]);
                              },
                            ),
                          ),
                        ),

                        // Let's Discover
                        buildHeadline(headline: 'Let\'s Discover'),
                        // discover cards
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                          child: Swiper(
                            index: 4,
                            autoplayDelay: 20000,
                            controller: controller.swiperController,
                            autoplayDisableOnInteraction: true,
                            duration: 200,
                            itemCount: swiperChannels.length,
                            axisDirection: AxisDirection.right,
                            autoplay: true,
                            itemBuilder: (BuildContext context, int index) {
                              return SwiperWidget(
                                channel: swiperChannels[index],
                                channelStream: controller.channelStreams
                                    .firstWhere((element) =>
                                        element.channel ==
                                        swiperChannels[index].id),
                              );
                            },
                            layout: SwiperLayout.STACK,
                            itemHeight: height * 0.35,
                            itemWidth: height * 0.35,
                            indicatorLayout: PageIndicatorLayout.SLIDE,
                          ),
                        ),
                        // Popular
                        buildHeadline(headline: 'Popular'),
                        // popular list view
                        SizedBox(
                          height: height * 0.25,
                          width: width,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, top: 8.0, bottom: 8.0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: popularChannels.length,
                              itemBuilder: (_, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(ChannelPage(
                                        channel: channels[index],
                                        channelStream: controller.channelStreams
                                            .firstWhere((element) =>
                                                element.channel ==
                                                channels[index].id)));
                                  },
                                  child: PopularWidget(
                                      channel: popularChannels[index]),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );

          case Status.error:
            return const Splash();
        }
      }),
    );
  }

  Padding buildHeadline({required String headline}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(headline,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }
}
