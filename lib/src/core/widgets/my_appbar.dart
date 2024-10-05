import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';

class MyAppbar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppbar(
      {super.key,
      this.title,
      this.action,
      this.isBack,
      this.titleWidget,
      this.onBack,
      this.height,
      this.backgroundColor});

  final String? title;
  final List<Widget>? action;
  final bool? isBack;
  final Widget? titleWidget;
  final VoidCallback? onBack;
  final double? height;
  final Color? backgroundColor;

  @override
  State<MyAppbar> createState() => _MyAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(height ?? 60);
}

class _MyAppbarState extends State<MyAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.backgroundColor,
      centerTitle: false,
      automaticallyImplyLeading: false,
      leading: widget.isBack == true
          ? IconButton(
              onPressed: widget.onBack ?? () => Navigator.pop(context),
              icon: const Icon(IconsaxOutline.arrow_left_2),
            )
          : null,
      title: widget.titleWidget ??
          (widget.title == null ? null : Text(widget.title!)),
      actions: widget.action,
    );
  }
}
