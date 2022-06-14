import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

@immutable
class ChannelStream {
  const ChannelStream({
    required this.channel,
    required this.url,
    required this.httpReferrer,
    required this.userAgent,
    required this.status,
    required this.width,
    required this.height,
    required this.bitrate,
  });

  final String channel;
  final String url;
  final String httpReferrer;
  final String userAgent;
  final String status;
  final int width;
  final int height;
  final int bitrate;

  factory ChannelStream.fromJson(Map<String, dynamic> json) => ChannelStream(
        channel: json['channel'].toString(),
        url: json['url'].toString(),
        httpReferrer: json['http_referrer'].toString(),
        userAgent: json['user_agent'].toString(),
        status: json['status'].toString(),
        width: json['width'] as int,
        height: json['height'] as int,
        bitrate: json['bitrate'] as int,
      );

  Map<String, dynamic> toJson() => {
        'channel': channel,
        'url': url,
        'http_referrer': httpReferrer,
        'user_agent': userAgent,
        'status': status,
        'width': width,
        'height': height,
        'bitrate': bitrate,
      };

  ChannelStream clone() => ChannelStream(
        channel: channel,
        url: url,
        httpReferrer: httpReferrer,
        userAgent: userAgent,
        status: status,
        width: width,
        height: height,
        bitrate: bitrate,
      );

  ChannelStream copyWith({
    String? channel,
    String? url,
    String? httpReferrer,
    String? userAgent,
    String? status,
    int? width,
    int? height,
    int? bitrate,
  }) =>
      ChannelStream(
        channel: channel ?? this.channel,
        url: url ?? this.url,
        httpReferrer: httpReferrer ?? this.httpReferrer,
        userAgent: userAgent ?? this.userAgent,
        status: status ?? this.status,
        width: width ?? this.width,
        height: height ?? this.height,
        bitrate: bitrate ?? this.bitrate,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChannelStream &&
          channel == other.channel &&
          url == other.url &&
          httpReferrer == other.httpReferrer &&
          userAgent == other.userAgent &&
          status == other.status &&
          width == other.width &&
          height == other.height &&
          bitrate == other.bitrate;

  @override
  int get hashCode =>
      channel.hashCode ^
      url.hashCode ^
      httpReferrer.hashCode ^
      userAgent.hashCode ^
      status.hashCode ^
      width.hashCode ^
      height.hashCode ^
      bitrate.hashCode;
}
