import 'package:flutter/cupertino.dart';

Widget buildLoadingWidget(){
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoActivityIndicator(),
      ],
    ),
  );
}