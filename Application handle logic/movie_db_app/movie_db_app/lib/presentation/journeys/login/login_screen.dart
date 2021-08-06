import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db_app/common/constants/size_constants.dart';
import 'package:movie_db_app/common/extensions/size_extensions.dart';
import 'package:movie_db_app/presentation/journeys/login/login_form.dart';
import 'package:movie_db_app/presentation/widgets/logo.dart';

class LoginScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: Sizes.dimen_32.h),
              child: Logo(height: Sizes.dimen_12.h),
            ),
          ),
          LoginForm(),

        ],
      ),
    );
  }
}