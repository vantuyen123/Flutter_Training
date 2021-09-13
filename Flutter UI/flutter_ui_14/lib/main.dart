import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_14/animation/fade_animation.dart';
import 'package:flutter_ui_14/view_socks.dart';
import 'package:page_transition/page_transition.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeAnimation(
              delay: 1,
              child: Container(
                padding: EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 60,
                ),
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    colors: [
                      Color.fromRGBO(255, 250, 182, 1),
                      Color.fromRGBO(255, 239, 78, 1)
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeAnimation(
                      delay: 1,
                      child: Image.asset(
                        'assets/images/menu.png',
                        width: 20,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: FadeAnimation(
                            delay: 1.2,
                            child: Text(
                              'Best Online \nSocks Collection',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(97, 90, 90, 1)),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: FadeAnimation(
                            delay: 1.3,
                            child: Image.asset(
                              'assets/images/header-socks.png',
                              width: 150,
                              height: 150,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, -35),
              child: FadeAnimation(
                delay: 1.2,
                child: Container(
                  height: 60,
                  padding: EdgeInsets.only(left: 20, top: 8),
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[350]!,
                            blurRadius: 20,
                            offset: Offset(0, 10))
                      ],
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: TextField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 20,
                        ),
                        hintText: 'Search',
                        border: InputBorder.none),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FadeAnimation(
                        delay: 1.2,
                        child: Text(
                          'Choose \ncategory',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromRGBO(97, 90, 90, 1)),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            FadeAnimation(
                              delay: 1.2,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color.fromRGBO(251, 53, 105, .1),
                                    onPrimary: Color.fromRGBO(251, 53, 105, .1),
                                    shadowColor: Colors.transparent),
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Adult',
                                    style: TextStyle(
                                        color: Color.fromRGBO(251, 53, 105, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            FadeAnimation(
                              delay: 1.3,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color.fromRGBO(97, 90, 90, .1),
                                    onPrimary: Color.fromRGBO(97, 90, 90, .1),
                                    shadowColor: Colors.transparent),
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Children',
                                    style: TextStyle(
                                        color: Color.fromRGBO(97, 90, 90, .6),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 280,
              width: double.infinity,
              child: ListView(
                padding: EdgeInsets.only(bottom: 20, left: 20),
                scrollDirection: Axis.horizontal,
                children: [
                  FadeAnimation(
                    delay: 1.3,
                    child: makeCard(
                        context: context,
                        startColor: Color.fromRGBO(251, 121, 155, 1),
                        endColor: Color.fromRGBO(251, 53, 105, 1),
                        image: 'assets/images/socks-one.png'),
                  ),
                  FadeAnimation(
                    delay: 1.4,
                    child: makeCard(
                        context: context,
                        startColor: Color.fromRGBO(203, 251, 255, 1),
                        endColor: Color.fromRGBO(81, 223, 234, 1),
                        image: 'assets/images/socks-two.png'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makeCard({context, startColor, endColor, image}) => GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  child: ViewSocks(), type: PageTransitionType.fade));
        },
        child: AspectRatio(
          aspectRatio: 4 / 5,
          child: Container(
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              gradient: LinearGradient(
                  begin: Alignment.topLeft, colors: [startColor, endColor]),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[350]!,
                  blurRadius: 10,
                  offset: Offset(5, 10),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Center(
                child: Image.asset(image),
              ),
            ),
          ),
        ),
      );
}
