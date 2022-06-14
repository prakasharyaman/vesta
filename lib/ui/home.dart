import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:search_page/search_page.dart';
import 'package:vesta/constants/constants.dart';
import 'package:vesta/ui/countrySelect/country_select.dart';
import 'package:vesta/ui/search/search_widget.dart';

import '../models/channel.dart';
import 'hompage/controller/home_controller.dart';
import 'hompage/home_page.dart';
import 'hompage/widgets/popular_widget.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4389A2),
      body: Container(
        decoration: kHomeBoxDecoration,
        child: NestedScrollView(
          controller: controller.scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              _homeAppBar(),
            ];
          },
          body: const HomePage(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF5C258D),
        onTap: (index) {
          if (index == 1) {
            showSearch(
                context: context,
                delegate: SearchPage<Channel>(
                  items: controller.channels,
                  showItemsOnEmpty: true,
                  searchLabel: 'Search Channels',
                  searchStyle: const TextStyle(color: Colors.white),
                  suggestion: const Center(
                    child: Text('Channels'),
                  ),
                  failure: const Center(
                    child: Text('No channels found :('),
                  ),
                  filter: (channel) => [
                    channel.name,
                    channel.country,
                  ],
                  builder: (channel) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SearchWidget(channel: channel),
                  ),
                ));
          } else if (index == 2) {
            Get.snackbar('You Are Not Signed In',
                " You don't need a profile , you can watch without one ");
          }
        },
        unselectedItemColor: const Color(0xFF5C258D).withOpacity(0.4),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  SliverAppBar _homeAppBar() {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      floating: true,
      pinned: false,
      title: Row(
        children: [
          const Icon(Icons.location_on),
          GestureDetector(
            onTap: () {
              Get.to(const CountrySelect());
            },
            child: Obx(() => Text(
                  "${controller.countryName}",
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                )),
          ),
          const Spacer(),
          GestureDetector(
              onTap: () {
                Get.snackbar('No notifications found', "");
              },
              child: const Icon(Icons.notifications_active_rounded)),
        ],
      ),
    );
  }
}
