import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vesta/models/index.dart';
import 'package:vesta/repositories/data_repositories.dart';
import 'package:vesta/ui/countrySelect/country_select.dart';
import '../../../util/status_enum.dart';

class HomeController extends GetxController {
  static HomeController homeController = Get.find();
  SwiperController swiperController = SwiperController();
  ScrollController scrollController = ScrollController();
  Rx<Status> status = Status.loading.obs;
  var countryName = 'Country'.obs;
  late DataRepository dataRepository;
  List<Channel> channels = [];
  List<Country> countries = [];
  List<String> categories = [];
  List<ChannelStream> channelStreams = [];
  List<Channel> swiperChannels = [];
  Country? country;
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    try {
      status.value = Status.loading;
      update();
      var box = await Hive.openBox('countryBox');
      var x = box.get('country');
      if (x != null) {
        country = Country.fromJson(Map<String, dynamic>.from(x));
        countryName.value = country!.name;
        update();
        dataRepository = DataRepository(country: country!.code);
        await await dataRepository.getChannels();
        await dataRepository.getCountries();
        countries = dataRepository.countries;
        channels = dataRepository.channels;
        channelStreams = dataRepository.channelStreams;
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
      } else {
        Get.to(const CountrySelect());
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
