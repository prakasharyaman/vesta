import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vesta/constants/constants.dart';

import '../../util/status_enum.dart';
import '../splash/splash.dart';
import 'controller/country_select_controller.dart';

class CountrySelect extends GetView<CountrySelectController> {
  const CountrySelect({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CountrySelectController>(
      init: CountrySelectController(),
      builder: (controller) => Obx(() {
        switch (controller.countryPageStatus.value) {
          case Status.loading:
            return const Splash();
          case Status.loaded:
            var countries = controller.countries;
            List<String> countryNames = [];
            for (var country in countries) {
              countryNames.add(country.name);
            }
            return Form(
              key: controller.formKey,
              child: Scaffold(
                backgroundColor: kPrimaryColor,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Select Your Country  🚩',
                          style: TextStyle(
                            fontSize: 60,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                    ),

                    // country selector
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: DropdownSearch<String>(
                          validator: (value) {
                            if (value == null) {
                              return 'Please select a country';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            controller.chanegCountry(
                                countryn: value.toString());
                            debugPrint(value);
                          },
                          dropdownButtonProps:
                              const DropdownButtonProps(tooltip: 'Countries'),
                          dropdownDecoratorProps: const DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                            hintText: 'Country',
                          )),
                          popupProps: const PopupProps.modalBottomSheet(
                              showSearchBox: true),
                          items: countryNames,
                        ),
                      ),
                    )
                  ],
                ),
                floatingActionButton: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    controller.formKey.currentState!.validate();
                    {
                      debugPrint('Country: ${controller.country.value}');
                      controller.saveCountry(
                          country: countries.firstWhere((element) =>
                              element.name == controller.country.value));
                    }
                  },
                  elevation: 5,
                  tooltip: 'Next',
                  child: Icon(
                    Icons.navigate_next_rounded,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            );
          case Status.error:
            return const Splash();
        }
      }),
    );
  }
}
