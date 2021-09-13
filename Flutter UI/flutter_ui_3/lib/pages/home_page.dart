import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_3/animations/FadeAnimation.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        brightness: Brightness.light,
        leading: Icon(null),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_basket,
              color: Colors.grey[800],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeAnimation(
                    1,
                    Text(
                      'Food Delivery',
                      style: TextStyle(
                          color: Colors.grey[80],
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        FadeAnimation(
                            1, makeCategory(isActive: true, title: 'Pizza')),
                        FadeAnimation(1.3,
                            makeCategory(isActive: false, title: 'Burgers')),
                        FadeAnimation(
                            1.4, makeCategory(isActive: false, title: 'Kebab')),
                        FadeAnimation(1.5,
                            makeCategory(isActive: false, title: 'Desert')),
                        FadeAnimation(
                            1.6, makeCategory(isActive: false, title: 'Salad')),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            FadeAnimation(
                1,
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Free Delivery',
                    style: TextStyle(
                        color: Colors.grey[70],
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [

                        FadeAnimation(
                            2.4,
                            makeItemPage(
                                image: 'https://c4.wallpaperflare.com/wallpaper/667/630/482/burger-dinner-food-hamburger-wallpaper-preview.jpg',
                            name: 'Burger',
                            price: '24.00')),
                        FadeAnimation(
                            2.5,
                            makeItemPage(
                                image:'https://c1.wallpaperflare.com/preview/765/211/654/pizza-pizza-hut-cooking-kitchen.jpg',
                            name: 'Pizza',
                            price: '14.00')),
                        FadeAnimation(
                            2.6,
                            makeItemPage(
                                image: 'https://c1.wallpaperflare.com/preview/32/389/309/food-picnic-shish-kebab-meat.jpg',
                                name: 'Food Picnic',
                              price: '8.00'
                            )),
                        FadeAnimation(
                            2.7,
                            makeItemPage(
                                image: 'https://c1.wallpaperflare.com/preview/775/143/582/cute-sweet-tasty-delicious.jpg',
                                name: 'Donut',
                                price: '8.00'
                            )),
                      ],
                    ))),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget makeCategory({isActive, title}) {
    return AspectRatio(
      aspectRatio: isActive ? 3 : 2.9 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: isActive ? Colors.yellow[700] : Colors.white,
            borderRadius: BorderRadius.circular(50)),
        child: Align(
          child: Text(
            title,
            style: TextStyle(
                color: isActive ? Colors.white : Colors.grey[500],
                fontSize: 20,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w100),
          ),
        ),
      ),
    );
  }

  Widget makeItemPage({image, name, price}) {
    return AspectRatio(
      aspectRatio: 0.6,
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover)),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(begin: Alignment.bottomCenter, stops: [
                  .2,
                  .9
                ], colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.3)
                ])),
            child: Padding(

              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ $price",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
