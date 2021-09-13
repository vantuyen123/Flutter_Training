import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:i_game_database/bloc/switch_bloc.dart';
import 'package:i_game_database/screens/discover_screens/discover_screen_list.dart';
import 'package:i_game_database/style/theme.dart' as Style;
import 'package:i_game_database/widgets/home_slider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  late PageController _pageController;
  late SwitchBloc _switchBloc;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _switchBloc = SwitchBloc();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _showGrid() {
    _switchBloc.showGrid();
  }

  void _showList() {
    _switchBloc.showList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF20232A),
      appBar: PreferredSize(
        child: Container(),
        preferredSize: Size.fromHeight(0.0),
      ),
      body: SizedBox.expand(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: [
            Column(
              children: [
                // HomeSlider(),
                DiscoverScreenList(),
              ],
            ),
            Container(
              child: Center(
                child: Text("Screen 2"),
              ),
            ),
            Container(
              child: Center(
                child: Text("Screen 3"),
              ),
            ),
            Container(
              child: Center(
                child: Text("Screen 4"),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        child: BottomNavyBar(
          containerHeight: 56,
          backgroundColor: Style.Colors.backgroundColor,
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
            _pageController.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              activeColor: Color(0xFF010101),
              title: Text(
                ' Discover',
                style: TextStyle(color: Style.Colors.mainColor, fontSize: 13),
              ),
              icon: Padding(
                padding: EdgeInsets.only(left: 5),
                child: Icon(
                  SimpleLineIcons.game_controller,
                  size: 18,
                  color: _currentIndex == 0
                      ? Style.Colors.mainColor
                      : Colors.white,
                ),
              ),
            ),
            BottomNavyBarItem(
              activeColor: Color(0xFF010101),
              title: Text(
                ' Search',
                style: TextStyle(color: Style.Colors.mainColor, fontSize: 13),
              ),
              icon: Padding(
                padding: EdgeInsets.only(left: 5),
                child: Icon(
                  SimpleLineIcons.magnifier,
                  size: 18,
                  color: _currentIndex == 1
                      ? Style.Colors.mainColor
                      : Colors.white,
                ),
              ),
            ),
            BottomNavyBarItem(
              activeColor: Color(0xFF010101),
              title: Text(
                ' Consoles',
                style: TextStyle(color: Style.Colors.mainColor, fontSize: 13),
              ),
              icon: Padding(
                padding: EdgeInsets.only(left: 5),
                child: Icon(
                  SimpleLineIcons.layers,
                  size: 18,
                  color: _currentIndex == 2
                      ? Style.Colors.mainColor
                      : Colors.white,
                ),
              ),
            ),
            BottomNavyBarItem(
              activeColor: Color(0xFF010101),
              title: Text(
                ' Profile',
                style: TextStyle(color: Style.Colors.mainColor, fontSize: 13),
              ),
              icon: Padding(
                padding: EdgeInsets.only(left: 5),
                child: Icon(
                  SimpleLineIcons.user,
                  size: 18,
                  color: _currentIndex == 3
                      ? Style.Colors.mainColor
                      : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
