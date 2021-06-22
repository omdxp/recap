import 'package:flutter/material.dart';
import 'package:recap/utils/constants.dart';
import 'package:recap/utils/data.dart';

class DetailPage extends StatelessWidget {
  final PlanetInfo planetInfo;

  const DetailPage({Key? key, required this.planetInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Text(
                            this.planetInfo.name,
                            style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 56,
                                color: primaryTextColor,
                                fontWeight: FontWeight.w900),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            'Solar System',
                            style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 31,
                                color: primaryTextColor,
                                fontWeight: FontWeight.w300),
                            textAlign: TextAlign.left,
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            this.planetInfo.description,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 20,
                                color: contentTextColor,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Divider(
                            color: Colors.black38,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: Text(
                        'Gallery',
                        style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 25,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w300),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      height: 250,
                      padding: const EdgeInsets.only(left: 32.0),
                      child: ListView.builder(
                          itemCount: this.planetInfo.images.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24)),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  this.planetInfo.images[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
              Positioned(
                  right: -64,
                  child: Hero(
                      tag: this.planetInfo.position,
                      child: Image.asset(this.planetInfo.iconImage))),
              Positioned(
                  top: 60,
                  left: 32,
                  child: Text(
                    this.planetInfo.position.toString(),
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 247,
                      color: primaryTextColor.withOpacity(0.08),
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.left,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios))
            ],
          )),
    );
  }
}
