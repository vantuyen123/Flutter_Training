import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'animation/FadeAnimation.dart';

void main() => runApp(MaterialApp(
      title: 'Flutter UI 6',
      home: HomePage(),
    ));

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  AnimationController _scaleController;
  Animation<double> _scaleAnimation;
  bool hide = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scaleController = AnimationController(vsync: this,
    duration: Duration(milliseconds: 300));

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 30.0
    ).animate(_scaleController)..addStatusListener((status){
      if(status == AnimationStatus.completed){

      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://c4.wallpaperflare.com/wallpaper/171/200/1021/samurai-vagabond-wallpaper-preview.jpg'),
              fit: BoxFit.cover),
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.6),
            Colors.black.withOpacity(.8),
            Colors.black.withOpacity(.3)
          ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeAnimation(
                  1,
                  Text(
                    "Find the best locations near tou for a good night.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        height: 1.1),
                  )),
              SizedBox(
                height: 30,
              ),
              FadeAnimation(
                  1.2,
                  Text(
                    "Let use find you an event for your interest",
                    style: TextStyle(
                        color: Colors.white.withOpacity(.7),
                        fontSize: 25,
                        fontWeight: FontWeight.w100),
                  )),
              SizedBox(height: 150,),
              InkWell(
                onTap: (){
                  setState(() {
                    hide = true;
                  });
                  _scaleController.forward();
                },
                child: AnimatedBuilder(
                  builder: (context,child) => Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.yellow[700]
                      ),
                      child: hide == false ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Find nearest event',style:TextStyle(fontSize: 18,color: Colors.white),),
                          Icon(Icons.arrow_forward_sharp,color: Colors.white,)
                        ],
                      ) : Container() ,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60,),
            ],
          ),
        ),
      ),
    );
  }
}
