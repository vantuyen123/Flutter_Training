import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_11/animation/fade_animation.dart';
import 'package:flutter_ui_11/item.dart';
import 'package:flutter_ui_11/samurai_detail.dart';

final List<String> listCategory = [
  "All",
  "Sneakers",
  "Football",
  "Soccer",
  "Golf"
];

final List<ItemImage> imageItem = [
  ItemImage(image: "assets/images/samurai_1.jpg", tag: "red"),
  ItemImage(image: "assets/images/samurai_2.jpg", tag: "blue"),
  ItemImage(image: "assets/images/samurai_3.jpg", tag: "yellow"),
  ItemImage(image: "assets/images/samurai_4.jpg", tag: "black"),
];

main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatelessWidget {
  Widget _buildItemCategory(String name) => AspectRatio(
        aspectRatio: 2.2 / 1,
        child: Container(
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              name,
              style: TextStyle(fontSize: 17),
            ),
          ),
        ),
      );

  Widget _buildAppBar() => AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: null,
        title: Text(
          "Shoes",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          )
        ],
      );

  Widget makeItem({image, tag, context}) => Hero(
        tag: tag,
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => SamuraiDetail(image: image,tag: tag),
            ),
          ),
          child: Container(
            height: 250,
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[400],
                      blurRadius: 10,
                      offset: Offset(0, 10))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sneakers",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Nike",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.favorite_border,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  "100\$",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              FadeAnimation(
                delay: 1.2,
                child: Container(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listCategory.length,
                    itemBuilder: (BuildContext context, index) =>
                        _buildItemCategory(listCategory[index]),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 800,
                child: ListView.builder(
                    itemCount: imageItem.length,
                    itemBuilder: (BuildContext context, index) => FadeAnimation(
                          delay: 1.3,
                          child: makeItem(
                              image: imageItem[index].image,
                              tag: imageItem[index].tag,
                              context: context),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
