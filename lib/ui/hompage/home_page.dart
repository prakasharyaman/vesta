import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:vesta/constants/constants.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ktransparentColor,
      body: RefreshIndicator(
        color: const Color(0xFF5C258D),
        onRefresh: () {
          return Future.delayed(const Duration(seconds: 1));
        },
        child: Stack(
          children: [
            ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: height * 0.08,
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              showBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  constraints: BoxConstraints(
                                    maxHeight: height * 0.8,
                                  ),
                                  context: context,
                                  builder: (context) {
                                    return GlassContainer(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                      height: height * 0.8,
                                      width: width,
                                      blur: 5,
                                      color: Colors.white.withOpacity(0.8),
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.white.withOpacity(0.5),
                                          Colors.white.withOpacity(0.9),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: GlassContainer(
                                height: height * 0.08,
                                blur: 5,
                                color: Colors.white,
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.white.withOpacity(0.5),
                                    Color.fromARGB(255, 208, 216, 236)
                                        .withOpacity(0.9),
                                  ],
                                ),
                                border: const Border.fromBorderSide(
                                    BorderSide.none),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(20),
                                ),
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Entertainment',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54)),
                                ))),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // Let's Discover
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Let\'s Discover',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
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
                                      'https://picsum.photos/200/300',
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
                                      backgroundImage: NetworkImage(
                                          'https://picsum.photos/200/300'),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('John Doe',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                      Text('News',
                                          style: TextStyle(
                                            fontSize: 10,
                                          )),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      );
                    },
                    layout: SwiperLayout.STACK,
                    itemHeight: height * 0.35,
                    itemWidth: height * 0.35,
                    indicatorLayout: PageIndicatorLayout.SLIDE,
                  ),
                ),
                // Popular
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Popular',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
                SizedBox(
                  height: height * 0.25,
                  width: width,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GlassContainer(
                            height: height * 0.25,
                            width: width * 0.35,
                            blur: 5,
                            color: Colors.white.withOpacity(0.8),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withOpacity(0.5),
                                Colors.white.withOpacity(0.9),
                              ],
                            ),
                            border: Border.fromBorderSide(BorderSide.none),
                            borderRadius: BorderRadius.circular(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        'https://picsum.photos/200/300',
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: Text('Aaj Tak',
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
