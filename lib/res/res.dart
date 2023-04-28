import 'package:flutter/cupertino.dart';
import 'package:injurydoctor/res/sizes.dart';
import 'package:injurydoctor/res/text_styles.dart';
import 'assets.dart';
import 'colors.dart';


 late AppAssets assets;
late AppColors colors;
late AppSizes sizes;
late TextStyles textStyles;

bool _isInitialized = false;

void initializeResources({  required BuildContext context}) {
  if (_isInitialized) {
    /**
     * this is to prevent
     * multiple initialization calls.
     */
    return;
  }

  sizes = AppSizes()..initializeSize(context);
  assets = AppAssets();
  colors = AppColors();
  textStyles = TextStyles();
}
