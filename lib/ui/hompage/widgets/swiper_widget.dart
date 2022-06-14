import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vesta/models/index.dart';
import 'package:vesta/ui/hompage/controller/home_controller.dart';
import 'package:video_player/video_player.dart';

import '../../channelPage/channel_page.dart';

class SwiperWidget extends StatefulWidget {
  const SwiperWidget({
    Key? key,
    required this.channel,
    required this.channelStream,
  }) : super(key: key);
  final Channel channel;
  final ChannelStream channelStream;

  @override
  State<SwiperWidget> createState() => _SwiperWidgetState();
}

class _SwiperWidgetState extends State<SwiperWidget> {
  // late BetterPlayerController _betterPlayerController;
  late Channel channel;
  late ChannelStream channelStream;
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    channel = widget.channel;
    _controller = VideoPlayerController.network(widget.channelStream.url)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller.setVolume(0);
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // video
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: _controller.value.isInitialized
                        ? Stack(
                            children: [
                              VideoPlayer(_controller),
                              // live text widget
                              _buildLiveTextWidget()
                            ],
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                                color: Colors.deepPurple),
                          )),
              ),
            ),
          ),
          // details  ,logo, title ,category
          Expanded(
            flex: 1,
            child: Row(children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                      channel.logo,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(channel.name,
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    Text(
                        channel.categories.isNotEmpty
                            ? channel.categories[0]
                            : '',
                        style: const TextStyle(
                          fontSize: 10,
                        )),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  icon: const Icon(
                    Icons.play_circle_fill_rounded,
                    color: Color(0xFF5C258D),
                    size: 35,
                  ),
                  onPressed: () {
                    Get.to(ChannelPage(
                        channel: channel,
                        channelStream: homeController.channelStreams.firstWhere(
                            (element) => element.channel == channel.id)));
                  },
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Positioned _buildLiveTextWidget() {
    return Positioned(
        top: 5,
        left: 5,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(5)),
          child: const Padding(
            padding: EdgeInsets.only(right: 8.0, left: 8.0, top: 2, bottom: 2),
            child: Text(
              'Live',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
