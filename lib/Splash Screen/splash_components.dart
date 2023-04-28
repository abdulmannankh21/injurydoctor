import 'package:flutter/cupertino.dart';

import '../res/res.dart';

class SplashComponents {
  Widget getSplashLogo() {
    return Image.asset(
      "assets/logo.png",
      width: sizes.width * 0.5,
      fit: BoxFit.fitWidth,
    );
  }
}
