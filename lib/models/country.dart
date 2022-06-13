import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

@immutable
class Country {
  const Country({
    required this.name,
    required this.code,
    required this.lang,
    required this.flag,
    required this.count,
  });

  final String name;
  final String code;
  final String lang;
  final String flag;
  final int count;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
      name: json['name'].toString(),
      code: json['code'].toString(),
      lang: json['lang'].toString(),
      flag: json['flag'].toString(),
      count: json['count'] as int);

  Map<String, dynamic> toJson() =>
      {'name': name, 'code': code, 'lang': lang, 'flag': flag, 'count': count};

  Country clone() =>
      Country(name: name, code: code, lang: lang, flag: flag, count: count);

  Country copyWith(
          {String? name,
          String? code,
          String? lang,
          String? flag,
          int? count}) =>
      Country(
        name: name ?? this.name,
        code: code ?? this.code,
        lang: lang ?? this.lang,
        flag: flag ?? this.flag,
        count: count ?? this.count,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Country &&
          name == other.name &&
          code == other.code &&
          lang == other.lang &&
          flag == other.flag &&
          count == other.count;

  @override
  int get hashCode =>
      name.hashCode ^
      code.hashCode ^
      lang.hashCode ^
      flag.hashCode ^
      count.hashCode;
}
