import 'package:flutter/material.dart';

import '../utils/style.dart';

class MLErrorWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPress;

  const MLErrorWidget({Key? key, required this.title, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _titleWidget(),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: onPress,
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            label: Text(
              'Try Again',
              textScaleFactor: 1,
              style: Style.bodyText1.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 0.0,
              fixedSize: const Size.fromWidth(double.maxFinite),
              padding: const EdgeInsets.all(16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Text _titleWidget() {
    return Text(
      title,
      textScaleFactor: 1.0,
      textAlign: TextAlign.center,
    );
  }
}
