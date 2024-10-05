import 'package:flutter/material.dart';
import 'package:health_care_app/src/core/responsive/app_responsive.dart';

import 'my_appbar.dart';

class MyScaffold extends StatelessWidget {
  final Widget body;
  final bool? useAppBar;
  final double? horizontalMargin;
  final String? appBarTitle;
  final List<Widget>? action;
  final Color? backgroundColor;
  final Widget? floatingButton;
  final bool? canBack;
  final Widget? titleWidget;
  final double? topPadding;
  final VoidCallback? onBack;
  final double? heightAppBar;
  final bool? isLoading;
  final Widget? endDrawer;
  final GlobalKey<ScaffoldState>? sKey;
  final bool? resizeToAvoidBottomInset;
  final bool? extendBodyBehindAppBar;
  final Color? appBarColor;
  final Widget? bottomNavigationBar;

  const MyScaffold(
      {super.key,
      required this.body,
      this.useAppBar,
      this.horizontalMargin,
      this.appBarTitle,
      this.action,
      this.backgroundColor,
      this.floatingButton,
      this.canBack,
      this.titleWidget,
      this.topPadding,
      this.onBack,
      this.heightAppBar,
      this.isLoading,
      this.endDrawer,
      this.sKey,
      this.resizeToAvoidBottomInset,
      this.extendBodyBehindAppBar,
      this.appBarColor,
      this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: sKey,
      extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
      backgroundColor: backgroundColor,
      endDrawer: endDrawer,
      bottomNavigationBar: bottomNavigationBar,
      appBar: useAppBar == true || canBack == true
          ? MyAppbar(
              title: appBarTitle,
              action: action,
              isBack: canBack,
              onBack: onBack,
              height: heightAppBar,
              titleWidget: titleWidget,
              backgroundColor: appBarColor,
            )
          : null,
      body: Padding(
        padding: context.padding(
            top: useAppBar == true ? 0 : topPadding ?? 80,
            bottom: 20,
            horizontal: horizontalMargin ?? 0),
        child: Stack(
          children: [
            if (isLoading == true)
              const Center(
                child: CircularProgressIndicator(),
              ),
            body,
          ],
        ),
      ),
      floatingActionButton: floatingButton != null
          ? Padding(
              padding: context.padding(bottom: 100, right: 15),
              child: floatingButton,
            )
          : null,
    );
  }
}
