import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vesta/constants/constants.dart';

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
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          selectedItemColor: const Color(0xFF5C258D),
          unselectedItemColor: const Color(0xFF5C258D).withOpacity(0.4),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }

  SliverAppBar _homeAppBar() {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      floating: true,
      pinned: true,
      title: Row(
        children: const [
          Icon(Icons.location_on),
          Text(
            'United States',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
          Spacer(),
          Icon(Icons.notifications_active_rounded),
        ],
      ),
      // bottom: TabBar(
      //   controller: tabController,
      //   tabs: const [
      //     Tab(
      //       text: 'All',
      //     ),
      //     Tab(
      //       text: 'Movies',
      //     ),
      //     Tab(
      //       text: 'News',
      //     ),
      //     Tab(
      //       text: 'Music',
      //     ),
      //     Tab(
      //       text: 'Entertainment',
      //     ),
      //     Tab(
      //       text: 'Travel',
      //     ),
      //   ],
      // ),
    );
  }
}
