import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

@immutable
class Channel {
  const Channel({
    required this.id,
    required this.name,
    required this.nativeName,
    required this.network,
    required this.country,
    required this.subdivision,
    required this.city,
    required this.broadcastArea,
    required this.languages,
    required this.categories,
    required this.isNsfw,
    required this.launched,
    required this.closed,
    required this.replacedBy,
    required this.website,
    required this.logo,
  });

  final String id;
  final String name;
  final String nativeName;
  final String network;
  final String country;
  final String subdivision;
  final String city;
  final List<String> broadcastArea;
  final List<String> languages;
  final List<String> categories;
  final bool isNsfw;
  final String launched;
  final String closed;
  final String replacedBy;
  final String website;
  final String logo;

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
      id: json['id'].toString(),
      name: json['name'].toString(),
      nativeName: json['native_name'].toString(),
      network: json['network'].toString(),
      country: json['country'].toString(),
      subdivision: json['subdivision'].toString(),
      city: json['city'].toString(),
      broadcastArea: (json['broadcast_area'] as List? ?? [])
          .map((e) => e as String)
          .toList(),
      languages:
          (json['languages'] as List? ?? []).map((e) => e as String).toList(),
      categories:
          (json['categories'] as List? ?? []).map((e) => e as String).toList(),
      isNsfw: json['is_nsfw'] as bool,
      launched: json['launched'].toString(),
      closed: json['closed'].toString(),
      replacedBy: json['replaced_by'].toString(),
      website: json['website'].toString(),
      logo: json['logo'].toString());

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'native_name': nativeName,
        'network': network,
        'country': country,
        'subdivision': subdivision,
        'city': city,
        'broadcast_area': broadcastArea.map((e) => e.toString()).toList(),
        'languages': languages.map((e) => e.toString()).toList(),
        'categories': categories.map((e) => e.toString()).toList(),
        'is_nsfw': isNsfw,
        'launched': launched,
        'closed': closed,
        'replaced_by': replacedBy,
        'website': website,
        'logo': logo
      };

  Channel clone() => Channel(
      id: id,
      name: name,
      nativeName: nativeName,
      network: network,
      country: country,
      subdivision: subdivision,
      city: city,
      broadcastArea: broadcastArea.toList(),
      languages: languages.toList(),
      categories: categories.toList(),
      isNsfw: isNsfw,
      launched: launched,
      closed: closed,
      replacedBy: replacedBy,
      website: website,
      logo: logo);

  Channel copyWith(
          {String? id,
          String? name,
          String? nativeName,
          String? network,
          String? country,
          String? subdivision,
          String? city,
          List<String>? broadcastArea,
          List<String>? languages,
          List<String>? categories,
          bool? isNsfw,
          String? launched,
          String? closed,
          String? replacedBy,
          String? website,
          String? logo}) =>
      Channel(
        id: id ?? this.id,
        name: name ?? this.name,
        nativeName: nativeName ?? this.nativeName,
        network: network ?? this.network,
        country: country ?? this.country,
        subdivision: subdivision ?? this.subdivision,
        city: city ?? this.city,
        broadcastArea: broadcastArea ?? this.broadcastArea,
        languages: languages ?? this.languages,
        categories: categories ?? this.categories,
        isNsfw: isNsfw ?? this.isNsfw,
        launched: launched ?? this.launched,
        closed: closed ?? this.closed,
        replacedBy: replacedBy ?? this.replacedBy,
        website: website ?? this.website,
        logo: logo ?? this.logo,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Channel &&
          id == other.id &&
          name == other.name &&
          nativeName == other.nativeName &&
          network == other.network &&
          country == other.country &&
          subdivision == other.subdivision &&
          city == other.city &&
          broadcastArea == other.broadcastArea &&
          languages == other.languages &&
          categories == other.categories &&
          isNsfw == other.isNsfw &&
          launched == other.launched &&
          closed == other.closed &&
          replacedBy == other.replacedBy &&
          website == other.website &&
          logo == other.logo;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      nativeName.hashCode ^
      network.hashCode ^
      country.hashCode ^
      subdivision.hashCode ^
      city.hashCode ^
      broadcastArea.hashCode ^
      languages.hashCode ^
      categories.hashCode ^
      isNsfw.hashCode ^
      launched.hashCode ^
      closed.hashCode ^
      replacedBy.hashCode ^
      website.hashCode ^
      logo.hashCode;
}
