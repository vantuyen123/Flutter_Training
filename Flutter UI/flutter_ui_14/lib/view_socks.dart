import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_14/animation/fade_animation.dart';

class ViewSocks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: mediaQuery.size.height / 3,
            child: FadeAnimation(
              delay: 1,
              child: Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    colors: [
                      Color.fromRGBO(251, 121, 155, 1),
                      Color.fromRGBO(251, 53, 105, 1)
                    ],
                  ),
                ),
                child: Transform.translate(
                    offset: Offset(30, -30),
                    child: FadeAnimation(delay: 1.2,
                    child: Image.asset('assets/images/details-page-header.png'))),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: FadeAnimation(
                delay: 1.2,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: mediaQuery.size.height / 1.4,
            child: FadeAnimation(
              delay: 1,
              child: Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeAnimation(
                        delay: 1.1,
                        child: Text(
                          'Ranger Sport',
                          style: TextStyle(
                              color: Color.fromRGBO(97, 90, 90, .54),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 20),
                      FadeAnimation(
                        delay: 1.2,
                        child: Text(
                          'Ankle Men\'s Athletic Sock',
                          style: TextStyle(
                              fontSize: 23,
                              color: Color.fromRGBO(97, 90, 90, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20),
                      FadeAnimation(
                        delay: 1.3,
                        child: Text(
                          'Ranger sport socks are a '
                          'fusion of material of the sturdiest quality and versatile design'
                          'that suits all purposes. Each pair of Ranger socks is knitted'
                          'from 100% combed cotton yarn running along a reinforced 2-Ply'
                          'core polyester based elastic through out the socks.',
                          style: TextStyle(
                              color: Color.fromRGBO(51, 51, 51, .54),
                              fontSize: 18,
                              height: 1.4),
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          FadeAnimation(
                            delay: 1.2,
                            child: Container(
                              width: 40,
                              height: 40,
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 3, color: Colors.red),
                                  shape: BoxShape.circle,
                                  color: Colors.white),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.black),
                              ),
                            ),
                          ),
                          FadeAnimation(
                            delay: 1.3,
                            child: Container(
                              width: 25,
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              height: 25,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(251, 53, 105, 1)),
                            ),
                          ),
                          FadeAnimation(
                            delay: 1.4,
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(81, 234, 234, 1)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      FadeAnimation(
                        delay: 1.2,
                        child: Text(
                          'More option',
                          style: TextStyle(
                              color: Color.fromRGBO(97, 90, 90, .54),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 80,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            FadeAnimation(
                              delay: 1.3,
                              child: AspectRatio(
                                aspectRatio: 3.2 / 1,
                                child: Container(
                                  padding: EdgeInsets.all(13),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.green[300]!),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 56,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Color.fromRGBO(251, 53, 105, 1)),
                                        child: Image.asset(
                                            'assets/images/socks-icon.png'),
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Ankle Length Socks',
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(97, 90, 90, 1),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            '23.345',
                                            style: TextStyle(
                                              color: Color.fromRGBO(97, 90, 90, .7),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            FadeAnimation(
                              delay: 1.4,
                              child: AspectRatio(
                                aspectRatio: 3.2 / 1,
                                child: Container(
                                  margin: EdgeInsets.only(left: 20),
                                  padding: EdgeInsets.all(13),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.green[300]!),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 56,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Color.fromRGBO(81, 234, 234, 1)),
                                        child: Image.asset(
                                            'assets/images/socks-icon-left.png'),
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Quarter Length Socks',
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(97, 90, 90, 1),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            '23.345',
                                            style: TextStyle(
                                              color: Color.fromRGBO(97, 90, 90, .7),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      FadeAnimation(
                        delay: 1.4,
                        child: Container(
                          height: 60,
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(251, 121, 155, 1),
                                Color.fromRGBO(251, 53, 105, 1)
                              ]),
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[300]!,
                                  blurRadius: 20,
                                )
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    '\$14.',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  Text(
                                    '54',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Pay',
                                style: TextStyle(color: Colors.white, fontSize: 25),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 50)
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
