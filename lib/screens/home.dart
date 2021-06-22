import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        child: SafeArea(
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
            DropdownButton(
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
              onChanged: (value) => {},
              icon: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Image.asset('assets/drop_down_icon.png'),
              ),
            )
          ],
        )),
      ),
    );
  }
}
