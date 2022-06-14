import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vesta/models/index.dart';

class DataRepository {
  DataRepository({required this.country});
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DateTime dateTime = DateTime.now();
  final String country;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  List<Channel> channels = [];
  List<String> categories = [];
  List<Country> countries = [];
  List<ChannelStream> channelStreams = [];
  //get list of channels
  getChannels() async {
    if (firebaseAuth.currentUser != null) {
      var channelSnapshot = await firestore
          .collection('countries')
          .doc(country)
          .collection('channels')
          .limit(1000)
          .get(const GetOptions(source: Source.serverAndCache));
      if (channelSnapshot.docs.isNotEmpty) {
        for (var channelSnapshot in channelSnapshot.docs) {
          var channelJson = channelSnapshot.data()['channel'];
          var streamJson = channelSnapshot.data()['stream'];
          if (channelJson.isNotEmpty && streamJson.isNotEmpty) {
            Channel channel = Channel.fromJson(channelJson);
            ChannelStream channelStream = ChannelStream.fromJson(streamJson);
            channels.add(channel);
            channelStreams.add(channelStream);
          }
        }
        var tempCategories = [];
        for (var channel in channels) {
          tempCategories.addAll(channel.categories);
        }
        for (var category in tempCategories) {
          var categoryx = tempCategories
              .where((element) => element == category && category != 'xxx')
              .toList();
          if (categoryx.isNotEmpty && categoryx.length > 3) {
            categories.add(category);
          }
        }
        categories = categories.toSet().toList();
        if (categories.length > 10) {
          categories = categories.sublist(0, 10);
        }
        debugPrint(categories.toString());
        debugPrint('found channels');
      }
    }
  }

// get a list of countries
  getCountries() async {
    if (firebaseAuth.currentUser != null) {
      var countriesSnapshot = await firestore
          .collection('countries')
          .get(const GetOptions(source: Source.serverAndCache));
      if (countriesSnapshot.docs.isNotEmpty) {
        for (var countrySnapshot in countriesSnapshot.docs) {
          var countryJson = countrySnapshot.data();
          if (countryJson.isNotEmpty) {
            Country country = Country.fromJson(countryJson);
            countries.add(country);
          }
        }
      }
    }
  }
}
