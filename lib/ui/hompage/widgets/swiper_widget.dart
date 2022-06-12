import 'package:flutter/material.dart';
import 'package:vesta/models/channel.dart';

class SwiperWidget extends StatelessWidget {
  const SwiperWidget({Key? key, required this.channel}) : super(key: key);
  final Channel channel;
  @override
  Widget build(BuildContext context) {
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
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    channel.logo,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )),
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
                  onPressed: () {},
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
