import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_4/FadeAnimation.dart';

void main() => runApp(MaterialApp(
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
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 450,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://c4.wallpaperflare.com/wallpaper/266/85/309/venom-wallpaper-preview.jpg'),
                            fit: BoxFit.cover)),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.black,
                            Colors.black.withOpacity(.3)
                          ])),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FadeAnimation(
                                1,
                                Text(
                                  'VeNom',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40),
                                )),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              children: [
                                FadeAnimation(
                                    1.2,
                                    Text(
                                      '60 Videos',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                    )),
                                SizedBox(
                                  width: 50,
                                ),
                                FadeAnimation(
                                    1.3,
                                    Text(
                                      '240k Subscribers',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeAnimation(
                          1.6,
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing "
                                "and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                                "when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,"
                                " but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s"
                                " with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                            style: TextStyle(color: Colors.grey, height: 1.4),
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      FadeAnimation(
                          1.6,
                          Text(
                            "Lorem Ipsum",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                          1.6,
                          Text("July, 11th 2021, Viet Nam, France",
                              style: TextStyle(
                                color: Colors.grey,
                              ))),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                          1.6,
                          Text(
                            "Nationality",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                          1.6,
                          Text("British",
                              style: TextStyle(
                                color: Colors.grey,
                              ))),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                          1.6,
                          Text(
                            "Videos",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                          1.8,
                          Container(
                            height: 200,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                makeVideo(
                                    image:
                                        'https://c4.wallpaperflare.com/wallpaper/670/39/737/venom-movie-venom-hd-4k-wallpaper-preview.jpg'),
                                makeVideo(
                                    image:
                                        'https://c4.wallpaperflare.com/wallpaper/165/864/929/venom-movie-venom-hd-4k-wallpaper-preview.jpg'),
                                makeVideo(
                                    image:
                                        'https://c4.wallpaperflare.com/wallpaper/854/562/424/venom-artwork-wallpaper-preview.jpg'),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 120,
                      ),
                    ],
                  )
                ]),
              )
            ],
          ),
          Positioned.fill(
            bottom: 30,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: FadeAnimation(
                  2,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.yellow[700],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Align(
                      child: Text("Follow",style: TextStyle(color: Colors.white),),
                    ),
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget makeVideo({String image}) {
  return AspectRatio(
    aspectRatio: 1.5 / 1,
    child: Container(
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1.0),
          borderRadius: BorderRadius.circular(20),
          image:
              DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
          Colors.black.withOpacity(.9),
          Colors.black.withOpacity(.3)
        ])),
        child: Align(
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 70,
          ),
        ),
      ),
    ),
  );
}
