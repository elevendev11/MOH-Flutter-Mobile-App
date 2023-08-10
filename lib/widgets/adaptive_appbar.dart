import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sa_cooperation/utils/style.dart';

class AdaptiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? imagePath;
  final List<Widget> actions;
  final bool centerTitle;
  final bool automaticallyImplyLeading;

  const AdaptiveAppBar(
    this.imagePath,
    this.title, {
    Key? key,
    this.actions = const [],
    this.centerTitle = true,
    this.automaticallyImplyLeading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(automaticallyImplyLeading);
    if (Platform.isIOS) {
      return CupertinoNavigationBar(
        padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
             backgroundColor: Style.pColor,
        automaticallyImplyLeading: automaticallyImplyLeading,
        middle: _titleWidget(),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (actions.isNotEmpty) ...actions,
          ],
        ),
      );
    }
    return AppBar(
      title: _titleWidget(),
      elevation: 0.5,
      iconTheme: const IconThemeData(
        color: Colors.white, //change your color here
      ),
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: Style.pColor,
      // centerTitle: centerTitle,
      actions: actions,
    );
  }

  Widget _titleWidget() {
    if (imagePath != null) {
      return Container(
        margin: const EdgeInsets.only(bottom: 2),
        child: Image.asset(
          imagePath!,
          width: 80,
          height: 55,
        ),
      );
    }
    return Text(
      title,
      style: Style.headline6.copyWith(
        color: Colors.white,
        fontSize: 22  
      ),
      textScaleFactor: 1.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
