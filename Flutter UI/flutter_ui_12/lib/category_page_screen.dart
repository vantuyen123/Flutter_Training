import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_12/animation/animation.dart';

class CategoryPageScreen extends StatefulWidget {
  final String title;
  final String image;
  final String tag;

  const CategoryPageScreen({
    Key? key,
    required this.title,
    required this.image,
    required this.tag,
  }) : super(key: key);

  @override
  _CategoryPageScreenState createState() => _CategoryPageScreenState();
}

class _CategoryPageScreenState extends State<CategoryPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: widget.tag,
              child: Material(
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.image), fit: BoxFit.cover),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(.0)
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FadeAnimation(
                                  delay: 1.2,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.search),
                                    color: Colors.white,
                                  ),
                                ),
                                FadeAnimation(
                                  delay: 1.2,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.favorite),
                                    color: Colors.white,
                                  ),
                                ),
                                FadeAnimation(
                                  delay: 1.2,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.shopping_cart),
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        FadeAnimation(
                          delay: 1.3,
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  FadeAnimation(
                    delay: 1.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "New Product",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "View More",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 11,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  FadeAnimation(
                    delay: 1.5,
                    child: makeProduct(
                        image: 'assets/images/beauty-1.jpg',
                        title: 'Beauty',
                        price: '100\$'),
                  ),
                  FadeAnimation(
                    delay: 1.6,
                    child: makeProduct(
                        image: 'assets/images/clothes-1.jpg',
                        title: 'Clothes',
                        price: '100\$'),
                  ),
                  FadeAnimation(
                    delay: 1.7,
                    child: makeProduct(
                        image: 'assets/images/glass.jpg',
                        title: 'Glass',
                        price: '100\$'),
                  ),
                  FadeAnimation(
                    delay: 1.8,
                    child: makeProduct(
                        image: 'assets/images/perfume.jpg',
                        title: 'Perfume',
                        price: '100\$'),
                  ),
                  FadeAnimation(
                    delay: 1.9,
                    child: makeProduct(
                        image: 'assets/images/person.jpg',
                        title: 'Person',
                        price: '100\$'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makeProduct({image, title, price}) => Container(
        height: 200,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.0)
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FadeAnimation(
                delay: 1.4,
                child: Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.favorite_border,
                    color: Colors.white,),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeAnimation(
                        delay: 1.5,
                        child: Text(
                          title,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      FadeAnimation(
                        delay: 1.6,
                        child: Text(
                          price,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  FadeAnimation(
                    delay: 2,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Center(
                        child: Icon(
                          Icons.add_shopping_cart,
                          size: 18,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
}
