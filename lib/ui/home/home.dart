import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vesta/constants/constants.dart';
import 'package:vesta/ui/home/tabs/all_home_page.dart';
import 'controller/home_controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabController;
  HomeController controller = Get.find();
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kHomeBoxDecoration,
        child: NestedScrollView(
          controller: controller.scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              _homeAppBar(),
            ];
          },
          body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: const [
                AllHomePage(),
                AllHomePage(),
                AllHomePage(),
                AllHomePage(),
                AllHomePage(),
                AllHomePage(),
              ]),
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
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: const [
            Text(
              'Vesta',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(Icons.notifications_active_rounded),
          ],
        ),
      ),
      bottom: TabBar(
        controller: tabController,
        tabs: const [
          Tab(
            text: 'All',
          ),
          Tab(
            text: 'Movies',
          ),
          Tab(
            text: 'News',
          ),
          Tab(
            text: 'Music',
          ),
          Tab(
            text: 'Entertainment',
          ),
          Tab(
            text: 'Travel',
          ),
        ],
      ),
    );
  }
}
