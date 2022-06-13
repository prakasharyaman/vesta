import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vesta/app/app.dart';
import 'package:vesta/models/country.dart';
import 'package:vesta/repositories/data_repositories.dart';
import 'package:vesta/ui/home.dart';
import 'package:vesta/ui/hompage/controller/home_controller.dart';
import 'package:vesta/util/status_enum.dart';

class CountrySelectController extends GetxController {
  List<Country> countries = [];
  final formKey = GlobalKey<FormState>();
  HomeController homeController = Get.find();

  var countryPageStatus = Status.loading.obs;
  DataRepository dataRepository = DataRepository(country: 'US');
  var country = 'US'.obs;
  @override
  void onInit() {
    getCountries();
    super.onInit();
  }

  chanegCountry({required String countryn}) {
    country.value = countryn;
    update();
  }

  saveCountry({required Country country}) async {
    countryPageStatus.value = Status.loading;
    var box = await Hive.openBox('countryBox');
    box.put('country', country.toJson());
    debugPrint('Saved country: ${country.toJson()}');
    homeController.getData();
    countryPageStatus.value = Status.loaded;
    Get.offAll(const App());
  }

// getting a list of countries
  getCountries() async {
    await dataRepository.getCountries();
    countries = dataRepository.countries;
    if (countries.isNotEmpty) {
      countryPageStatus.value = Status.loaded;
    } else {
      countryPageStatus.value = Status.error;
    }
    update();
  }
}
