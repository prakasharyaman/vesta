import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class Stream {

  const Stream({
    required this.channel,
    required this.url,
    required this.httpReferrer,
    required this.userAgent,
    required this.status,
    required this.width,
    required this.height,
    required this.bitrate,
    required this.frameRate,
  });

  final String channel;
  final String url;
  final String httpReferrer;
  final String userAgent;
  final String status;
  final int width;
  final int height;
  final int bitrate;
  final double frameRate;

  factory Stream.fromJson(Map<String,dynamic> json) => Stream(
    channel: json['channel'].toString(),
    url: json['url'].toString(),
    httpReferrer: json['http_referrer'].toString(),
    userAgent: json['user_agent'].toString(),
    status: json['status'].toString(),
    width: json['width'] as int,
    height: json['height'] as int,
    bitrate: json['bitrate'] as int,
    frameRate: json['frame_rate'] as double
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
    'frame_rate': frameRate
  };

  Stream clone() => Stream(
    channel: channel,
    url: url,
    httpReferrer: httpReferrer,
    userAgent: userAgent,
    status: status,
    width: width,
    height: height,
    bitrate: bitrate,
    frameRate: frameRate
  );


  Stream copyWith({
    String? channel,
    String? url,
    String? httpReferrer,
    String? userAgent,
    String? status,
    int? width,
    int? height,
    int? bitrate,
    double? frameRate
  }) => Stream(
    channel: channel ?? this.channel,
    url: url ?? this.url,
    httpReferrer: httpReferrer ?? this.httpReferrer,
    userAgent: userAgent ?? this.userAgent,
    status: status ?? this.status,
    width: width ?? this.width,
    height: height ?? this.height,
    bitrate: bitrate ?? this.bitrate,
    frameRate: frameRate ?? this.frameRate,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Stream && channel == other.channel && url == other.url && httpReferrer == other.httpReferrer && userAgent == other.userAgent && status == other.status && width == other.width && height == other.height && bitrate == other.bitrate && frameRate == other.frameRate;

  @override
  int get hashCode => channel.hashCode ^ url.hashCode ^ httpReferrer.hashCode ^ userAgent.hashCode ^ status.hashCode ^ width.hashCode ^ height.hashCode ^ bitrate.hashCode ^ frameRate.hashCode;
}
