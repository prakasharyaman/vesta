import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vesta/models/country.dart';
import 'package:vesta/repositories/data_repositories.dart';

import '../../../models/channel.dart';
import '../../../util/status_enum.dart';

class HomeController extends GetxController {
  static HomeController homeController = Get.find();
  ScrollController scrollController = ScrollController();
  Rx<Status> status = Status.loading.obs;
  DataRepository dataRepository = DataRepository(country: 'US');
  List<Channel> channels = [];
  List<Country> countries = [];
  List<String> categories = [];
  List<Channel> swiperChannels = [];
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    try {
      status.value = Status.loading;
      update();
      await dataRepository.getChannels();
      await dataRepository.getCountries();
      countries = dataRepository.countries;
      channels = dataRepository.channels;
      categories = dataRepository.categories;
      debugPrint(channels.first.name.toString());
      debugPrint(countries.length.toString());
      debugPrint(categories.length.toString());
      channels.shuffle();
      if (channels.length > 5) {
        swiperChannels = channels.sublist(0, 5);
        channels.removeWhere((element) => swiperChannels.contains(element));
      } else {
        throw Exception('No channels found');
      }

      status.value = Status.loaded;
      update();
    } catch (e) {
      debugPrint(e.toString());
      status.value = Status.error;
      update();
    }
  }
}
