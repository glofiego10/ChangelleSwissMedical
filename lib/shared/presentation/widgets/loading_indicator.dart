import 'package:challenge_swiss/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.red),
          strokeWidth: 5.0,
        ),
        SizedBox(height: 20),
        Text(
          'Cargando...',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }
}
