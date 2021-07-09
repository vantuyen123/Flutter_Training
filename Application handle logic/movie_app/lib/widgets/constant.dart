import 'package:flutter/material.dart';

Widget buildErrorWidget(Object error) {
  return Center(child:  Text('Occured $error'),);
}

Widget buildLoadingWidget() {
  return Container(
    width: 50,
    height: 50,
    child: CircularProgressIndicator(),
  );
}