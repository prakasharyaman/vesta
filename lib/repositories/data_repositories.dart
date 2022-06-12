import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vesta/models/channel.dart';
import 'package:vesta/models/country.dart';

class DataRepository {
  DataRepository({required this.country});
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DateTime dateTime = DateTime.now();
  final String country;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  List<Channel> channels = [];
  List<String> categories = [];
  List<Country> countries = [];
  //get list of channels
  getChannels() async {
    if (firebaseAuth.currentUser != null) {
      var channelSnapshot = await firestore
          .collection('countries')
          .doc(country)
          .collection('channels')
          .get();
      if (channelSnapshot.docs.isNotEmpty) {
        for (var channelSnapshot in channelSnapshot.docs) {
          var channelJson = channelSnapshot.data()['channel'];
          if (channelJson.isNotEmpty) {
            Channel channel = Channel.fromJson(channelJson);
            channels.add(channel);
          }
        }
        print('created channels');
      }
    }
  }

// get a list of countries
  getCountries() async {
    if (firebaseAuth.currentUser != null) {
      var countriesSnapshot = await firestore.collection('countries').get();
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
