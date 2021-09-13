import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            padding: EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[200]),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          )),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Icon(
                  Icons.camera_alt,
                  color: Colors.grey[800],
                  size: 30,
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "Stories",
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              letterSpacing: 1.2),
                        ),
                        Text("See Archive")
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 180,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          makeStory(
                            storyImage: 'assets/images/story/story-1.jpg',
                            userImage: 'assets/images/aatik-tasneem.jpg',
                            userName: 'Aatik Tasneem',
                          ),
                          makeStory(
                            storyImage: 'assets/images/story/story-2.jpg',
                            userImage: 'assets/images/aiony-haust.jpg',
                            userName: 'Aiony Haust',
                          ),
                          makeStory(
                            storyImage: 'assets/images/story/story-3.jpg',
                            userImage: 'assets/images/averie-woodard.jpg',
                            userName: 'Averie Woodard',
                          ),
                          makeStory(
                            storyImage: 'assets/images/story/story-4.jpg',
                            userImage: 'assets/images/azamat-zhanisov.jpg',
                            userName: 'Azamat Zhanisov',
                          ),
                          makeStory(
                            storyImage: 'assets/images/story/story-5.jpg',
                            userImage: 'assets/images/azamat-zhanisov-.jpg',
                            userName: 'Azamat Zhanisov',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    _buildMakeFeed(
                        userName: 'Aiony Haust',
                        userImage: 'assets/images/aiony-haust.jpg',
                        feedTime: '1 hr ago',
                        feedText:
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        feedImage: 'assets/images/story/story-2.jpg'),
                    _buildMakeFeed(
                        userName: 'Aiony Haust',
                        userImage: 'assets/images/aiony-haust.jpg',
                        feedTime: '1 hr ago',
                        feedText:
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        feedImage: 'assets/images/story/story-2.jpg'),
                    _buildMakeFeed(
                        userName: 'Aiony Haust',
                        userImage: 'assets/images/aiony-haust.jpg',
                        feedTime: '1 hr ago',
                        feedText:
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        feedImage: 'assets/images/story/story-2.jpg'),
                    _buildMakeFeed(
                        userName: 'Aiony Haust',
                        userImage: 'assets/images/aiony-haust.jpg',
                        feedTime: '1 hr ago',
                        feedText:
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        feedImage: 'assets/images/story/story-2.jpg'),
                    _buildMakeFeed(
                        userName: 'Aiony Haust',
                        userImage: 'assets/images/aiony-haust.jpg',
                        feedTime: '1 hr ago',
                        feedText:
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        feedImage: 'assets/images/story/story-2.jpg'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget makeStory({storyImage, userImage, userName}) => AspectRatio(
        aspectRatio: 1.6 / 2,
        child: Container(
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(storyImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.1)
              ]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                      image: DecorationImage(
                          image: AssetImage(userImage), fit: BoxFit.cover)),
                ),
                Text(
                  userName,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      );

  Widget _buildMakeFeed({userName, userImage, feedTime, feedText, feedImage}) =>
      Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(userImage), fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                        SizedBox(height: 3),
                        Text(
                          feedTime,
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(width: 190),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_vert,
                        size: 30,
                        color: Colors.grey[600],
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(feedText,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[800],
                    height: 1.5,
                    letterSpacing: 1)),
            SizedBox(
              height: 20,
            ),
            feedImage != '' ?
            Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(feedImage), fit: BoxFit.cover)),
            ) : Container(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _buildMakeLike(),
                    Transform.translate(
                        offset: Offset(-5, 0), child: _buildMakeLove()),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "2.5K",
                      style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                    ),
                  ],
                ),
                Text(
                  "400 Comments",
                  style: TextStyle(fontSize: 13, color: Colors.grey[800]),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween ,
              children: [
                _buildMakeLikeButton(isActive: true),
                _buildMakeCommentButton(),
                _buildMakeShare(),
              ],
            )
          ],
        ),
      );

  Widget _buildMakeLike() => Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white),
        ),
        child: Center(
          child: Icon(
            Icons.thumb_up,
            size: 12,
            color: Colors.white,
          ),
        ),
      );

  Widget _buildMakeLove() => Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white),
        ),
        child: Center(
          child: Icon(
            Icons.favorite,
            size: 12,
            color: Colors.white,
          ),
        ),
      );

  Widget _buildMakeLikeButton({required bool isActive}) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[200]!),
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.thumb_up,
                color: isActive ? Colors.blue : Colors.grey,
              ),
              SizedBox(width: 5),
              Text(
                "Like",
                style: TextStyle(color: isActive ? Colors.blue : Colors.grey),
              )
            ],
          ),
        ),
      );

  Widget _buildMakeCommentButton() => Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[200]!),
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.chat,
                color: Colors.grey,
              ),
              SizedBox(width: 5),
              Text(
                "Comment",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      );

  Widget _buildMakeShare() => Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[200]!),
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.share,
                color: Colors.grey,
              ),
              SizedBox(width: 5),
              Text(
                "Share",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      );
}
