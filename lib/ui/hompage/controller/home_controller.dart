import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vesta/repositories/data_repositories.dart';

import '../../../models/channel.dart';

class HomeController extends GetxController {
  static HomeController homeController = Get.find();
  ScrollController scrollController = ScrollController();
  DataRepository dataRepository = DataRepository(country: 'US');
  List<Channel> channels = [];
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    await dataRepository.getChannels();
    channels = dataRepository.channels;
    debugPrint(channels.first.name.toString());
  }
}
