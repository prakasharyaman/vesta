import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5C258D),
      body: Center(
        child: Image.asset(
          'assets/images/giflogo.gif',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
