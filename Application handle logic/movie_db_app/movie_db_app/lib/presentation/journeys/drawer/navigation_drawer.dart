import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db_app/common/constants/language.dart';
import 'package:movie_db_app/common/extensions/size_extensions.dart';
import 'package:movie_db_app/common/constants/size_constants.dart';
import 'package:movie_db_app/presentation/journeys/drawer/navigation_expanded_list_tile.dart';
import 'package:movie_db_app/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:movie_db_app/presentation/widgets/logo.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4)
      ]),
      width: Sizes.dimen_300.w,
      // color: Theme.of(context).primaryColor.withOpacity(0.7),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: Sizes.dimen_8.h,
                  bottom: Sizes.dimen_18.h,
                  left: Sizes.dimen_8.w,
                  right: Sizes.dimen_8.w),
              child: Logo(
                height: Sizes.dimen_12.h,
              ),
            ),
            NavigationListItem(title: 'Favorite', onPressed: () {}),
            NavigationExpandedListTile(
                title: 'Language',
                children: Languages.languages.map((e) => e.value).toList(),
                onPressed: () {}),
            NavigationListItem(title: 'Feedback', onPressed: () {}),
            NavigationListItem(title: 'About ', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
