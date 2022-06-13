import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vesta/constants/constants.dart';
import 'package:vesta/ui/countrySelect/country_select.dart';

import 'hompage/controller/home_controller.dart';
import 'hompage/home_page.dart';

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
            child: Text(
              controller.country == null
                  ? 'Select Country'
                  : controller.country!.name,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
          ),
          const Spacer(),
          const Icon(Icons.notifications_active_rounded),
        ],
      ),
    );
  }
}
