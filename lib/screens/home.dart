import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:recap/screens/detail.dart';
import 'package:recap/utils/constants.dart';
import 'package:recap/utils/data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [gradientStartColor, gradientEndColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.3, 0.7]),
        ),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Text(
                    'Explore',
                    style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 44,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.left,
                  ),
                  DropdownButton<dynamic>(
                    items: [
                      DropdownMenuItem(
                          child: Text(
                        'Solar System',
                        style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 24,
                            color: const Color(0x7cdbf1ff),
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                      )),
                    ],
                    onChanged: (value) {},
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Image.asset('assets/drop_down_icon.png'),
                    ),
                    underline: SizedBox(),
                  ),
                ],
              ),
            ),
            Container(
              height: 500,
              padding: const EdgeInsets.only(left: 32),
              child: Swiper(
                itemCount: planets.length,
                itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                layout: SwiperLayout.STACK,
                pagination: SwiperPagination(
                    builder:
                        DotSwiperPaginationBuilder(activeSize: 20, space: 8)),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, a, b) =>
                                  DetailPage(planetInfo: planets[index])));
                    },
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32)),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 100,
                                    ),
                                    Text(
                                      planets[index].name,
                                      style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 44,
                                          color: primaryTextColor,
                                          fontWeight: FontWeight.w900),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      'Solar System',
                                      style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 23,
                                          color: primaryTextColor,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(
                                      height: 32,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Know more',
                                          style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 18,
                                              color: secondaryTextColor,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.left,
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: secondaryTextColor,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Hero(
                            tag: planets[index].position,
                            child: Image.asset(planets[index].iconImage))
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        )),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(36.0),
            ),
            color: navigationColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {}, icon: Image.asset('assets/menu_icon.png')),
            IconButton(
                onPressed: () {}, icon: Image.asset('assets/search_icon.png')),
            IconButton(
                onPressed: () {}, icon: Image.asset('assets/profile_icon.png')),
          ],
        ),
      ),
    );
  }
}
