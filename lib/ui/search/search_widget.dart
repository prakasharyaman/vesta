import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

import '../../models/channel.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key, required this.channel}) : super(key: key);

  final Channel channel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GlassContainer(
        height: 170,
        width: double.infinity,
        blur: 5,
        color: Colors.deepPurple.withOpacity(0.3),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.deepPurple.withOpacity(0.1),
            Colors.white.withOpacity(0.9),
          ],
        ),
        border: const Border.fromBorderSide(BorderSide.none),
        borderRadius: BorderRadius.circular(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    channel.logo,
                    width: 200,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(channel.name,
                    maxLines: 4,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
