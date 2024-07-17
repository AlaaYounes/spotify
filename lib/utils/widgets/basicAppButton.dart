import 'package:flutter/material.dart';
import 'package:spotify/core/config/theme/app_colors.dart';

class BasicAppButton extends StatelessWidget {
  VoidCallback onPressed;
  String title;
  double? height;
  double? width;
  Color? color;

  BasicAppButton(
      {required this.onPressed,
      required this.title,
      this.height,
      this.width,
      this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width ?? 200, height ?? 80),
          backgroundColor: color,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.white),
        ));
  }
}
