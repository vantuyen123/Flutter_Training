import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db_app/common/constants/size_constants.dart';
import 'package:movie_db_app/common/extensions/size_extensions.dart';
import 'package:movie_db_app/common/extensions/string_extensions.dart';
import 'package:movie_db_app/presentation/themes/app_color.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isEnable;

  const Button(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.isEnable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: isEnable
                ? [AppColor.royalBlue, AppColor.violet]
                : [Colors.grey, Colors.grey]),
        borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_20.w)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.dimen_18.w,
      ),
      height: Sizes.dimen_16.h,
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_12.h),
      child: TextButton(
          onPressed: isEnable ? onPressed : null,
          child: Text(
            text.t(context),
            style: Theme.of(context).textTheme.button,
          )),
    );
  }
}
