import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:vesta/constants/constants.dart';

class AllHomePage extends StatelessWidget {
  const AllHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ktransparentColor,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          // Let's Discover
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Let\'s Discover',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          // discover cards
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
            child: Swiper(
              autoplayDisableOnInteraction: true,
              itemCount: 3,
              axisDirection: AxisDirection.right,
              autoplay: false,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Container(
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                'https://picsum.photos/200/300',
                                height: 220,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              )),
                        ),
                      ],
                    ),
                  ),
                );
              },
              layout: SwiperLayout.STACK,
              itemHeight: 300,
              itemWidth: 300,
              indicatorLayout: PageIndicatorLayout.SLIDE,
            ),
          ),
          // Popular
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Popular',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 230,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 150,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  'https://picsum.photos/200/300',
                                  height: 150,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text('Aaj Tak',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
          // SizedBox(
          //   height: 100,
          //   child: ListView.builder(
          //     shrinkWrap: true,
          //     physics: NeverScrollableScrollPhysics(),
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (_, index) {
          //       return
          //     },
          //     itemCount: 3,
          //   ),
          // )
        ],
      ),
    );
  }
}
        // Expanded(
        //               flex: 3,
        //               child: Card(
        //                 shape: const RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.only(
        //                     topLeft: Radius.circular(15),
        //                     topRight: Radius.circular(15),
        //                     bottomRight: Radius.circular(
        //                       15,
        //                     ),
        //                   ),
        //                 ),
        //                 child: ClipRRect(
        //                     borderRadius: const BorderRadius.only(
        //                         bottomRight: Radius.circular(
        //                           15,
        //                         ),
        //                         bottomLeft: Radius.circular(20)),
        //                     child: Image.network(
        //                       'https://picsum.photos/200/300',
        //                       height: 300,
        //                       fit: BoxFit.cover,
        //                       width: double.infinity,
        //                     )),
        //               ),
        //             ),
        //             Expanded(
        //               flex: 1,
        //               child: Card(
        //                 shape:
        //                     RoundedRectangleBorder(borderRadius: kBorderRadius),
        //                 child: Row(
        //                   children: const [
        //                     Expanded(flex: 2, child: Text('Title')),
        //                     Expanded(
        //                       flex: 1,
        //                       child: Icon(
        //                         Icons.play_circle_fill_rounded,
        //                         color: Colors.blue,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             )
                