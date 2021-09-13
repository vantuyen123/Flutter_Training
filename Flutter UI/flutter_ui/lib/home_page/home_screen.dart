import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.black87,
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(244, 243, 243, 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Promo Today',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Container(
                    height: 250,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        promoCard(
                            "https://c4.wallpaperflare.com/wallpaper/314/852/906/warrior-fantasy-art-samurai-sword-wallpaper-preview.jpg"),
                        promoCard(
                            "https://c4.wallpaperflare.com/wallpaper/210/251/600/guweiz-samurai-women-warrior-fantasy-girl-hd-wallpaper-preview.jpg"),
                        promoCard(
                            "https://c4.wallpaperflare.com/wallpaper/651/631/809/girl-cg-artwork-anime-art-anime-girl-wallpaper-preview.jpg"),
                        promoCard(
                            "https://c4.wallpaperflare.com/wallpaper/824/285/68/women-portrait-display-artwork-digital-art-wallpaper-preview.jpg"),
                        promoCard(
                            "https://c4.wallpaperflare.com/wallpaper/317/78/527/wlop-ghost-blade-ghost-blade-women-wallpaper-preview.jpg"),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://c4.wallpaperflare.com/wallpaper/618/252/919/anime-demon-slayer-kimetsu-no-yaiba-zenitsu-agatsuma-hd-wallpaper-preview.jpg'))),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              stops: [
                                0.1,
                                0.9
                              ],
                              colors: [
                                Colors.black.withOpacity(.8),
                                Colors.black.withOpacity(.1)
                              ])),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Best Design',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AspectRatio promoCard(String image) {
    return AspectRatio(
      aspectRatio: 2.3 / 3,
      child: Container(
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(image),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              stops: [0.2, 0.8],
              colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.vertical(bottom: Radius.circular(30))),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Find your',
            style: TextStyle(color: Colors.black87, fontSize: 25),
          ),
          SizedBox(height: 3),
          Text(
            "Inspiration",
            style: TextStyle(color: Colors.black, fontSize: 40,fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Color.fromRGBO(244, 243, 243, 1),
                borderRadius: BorderRadius.circular(15)),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black87,
                  ),
                  hintText: "Search you're looking for",
                  hintStyle:
                  TextStyle(color: Colors.grey, fontSize: 18)),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
