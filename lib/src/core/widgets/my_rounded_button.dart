import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/src/core/responsive/app_responsive.dart';
import 'package:health_care_app/src/core/theme/my_colorscheme.dart';
import 'package:health_care_app/src/core/widgets/my_text.dart';

class RoundedButton extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final Color textColor;
  final Color? borderColor;
  final String? imagePath;
  final double buttonTextSize;
  final double? height;
  final VoidCallback? onPressed;
  final ShapeBorder shape;
  final Widget? widget;

  const RoundedButton({
    super.key,
    this.buttonText,
    this.buttonColor,
    this.textColor = Colors.white,
    this.onPressed,
    this.imagePath,
    this.borderColor,
    this.shape = const StadiumBorder(),
    this.buttonTextSize = 14.0,
    this.height,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.sizeWidth(16))),
      ),
      child: widget ?? Text(buttonText!),
    );
  }

  factory RoundedButton.textAndDownArrow(BuildContext context, String str) {
    return RoundedButton(
      buttonColor: colorScheme(context).primary,
      textColor: colorScheme(context).surface,
      onPressed: () {},
      widget: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyText.bodySmall(context, str),
          context.sizedBox(width: 5),
          const Icon(IconsaxOutline.arrow_down_1)
        ],
      ),
    );
  }
}
