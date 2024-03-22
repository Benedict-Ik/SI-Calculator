import 'package:flutter/material.dart';

const minimumPadding = 5.0;

Widget getMoneyImageAsset() {
  AssetImage assetImage = const AssetImage('lib/assets/images/money.png');
  Image image = Image(
    image: assetImage,
    width: 200.0,
    height: 200.0,
  );
  return Container(
    margin: const EdgeInsets.all(minimumPadding * 5),
    child: Center(
      child: image,
    ),
  );
}
