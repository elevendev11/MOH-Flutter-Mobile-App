import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:sa_cooperation/utils/style.dart';


class ReadMore {
  static ReadMoreText readMore(String title, {int trimLines = 3, TextStyle? textStyle}) {
    return ReadMoreText(
      title,
      style: textStyle ??
          Style.bodyText1.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
      trimLines: trimLines,
      textScaleFactor: 1.0,
      trimMode: TrimMode.Line,
      colorClickableText: Colors.blue,
    );
  }
}