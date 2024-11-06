import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppButtonStyle {
  static final buttonStyleCommon = ElevatedButton.styleFrom(
    backgroundColor: AppColors.red,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 0,
  );
}
