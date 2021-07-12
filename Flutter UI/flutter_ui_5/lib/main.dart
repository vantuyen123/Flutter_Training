import 'package:animator/animator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://c4.wallpaperflare.com/wallpaper/142/751/831/landscape-anime-digital-art-fantasy-art-wallpaper-preview.jpg"),
                    fit: BoxFit.cover)),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.9),
                        Colors.black.withOpacity(0.3)
                      ])),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 250,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          makeItem(
                              image:
                              "https://c4.wallpaperflare.com/wallpaper/142/751/831/landscape-anime-digital-art-fantasy-art-wallpaper-preview.jpg"),
                          makeItem(
                              image:
                              "https://c4.wallpaperflare.com/wallpaper/138/993/73/digital-art-samurai-warrior-landscape-wallpaper-preview.jpg"),
                          makeItem(
                              image:
                              "https://c4.wallpaperflare.com/wallpaper/152/648/953/samurai-pixiv-fantasia-ultrawide-ultra-wide-wallpaper-preview.jpg"),
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                  ],
                ),
              ),
            ),
          ),
          makePoint(top: 140, left: 40),
          makePoint(top: 190, left: 190),
          makePoint(top: 219, left: 40),
        ],
      ),
    );
  }

  Widget makeItem({String image}) {
    return AspectRatio(
      aspectRatio: 1.7 / 2,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(image),
                          fit: BoxFit.cover)),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200]),
                  child: Text(
                    '2.1 m',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Golde Gate Bridge',
              style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.star_border,
                color: Colors.yellow[700],
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makePoint({double top, double left}) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue.withOpacity(0.3)
      ),
        child: Animator<double>(
          duration: Duration(seconds: 1),
          tween: Tween<double>(begin: 4.0,end: 6.0),
          cycles: 0,
          builder: (context) => Center(
            child: Container(
              margin: EdgeInsets.all(context.value),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue
                ),
            ),
          ),
        ),
      ),
    );
  }
}
