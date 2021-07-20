import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db_app/common/constants/size_constants.dart';
import 'package:movie_db_app/common/extensions/size_extensions.dart';

class NavigationExpandedListTile extends StatelessWidget {
  final String title;
  final Function onPressed;
  final List<String> children;

  const NavigationExpandedListTile(
      {Key key,
      @required this.title,
      @required this.children,
      @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(.7),
              blurRadius: 2)
        ]),
        child: ExpansionTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          children: [
            for (int i = 0; i < children.length; i++)
              NavigationExpandedSubListTile(
                  title: children[i], onPressed: () {})
          ],
        ),
      ),
    );
  }
}

class NavigationExpandedSubListTile extends StatelessWidget {
  final String title;
  final Function onPressed;

  const NavigationExpandedSubListTile(
      {Key key, @required this.title, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(.7),
              blurRadius: 2)
        ]),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: Sizes.dimen_32.w),
          title: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}
