import 'package:flutter/material.dart';
import 'package:health_care_app/src/core/responsive/app_responsive.dart';

class MyProgressIndicatorWidget extends StatelessWidget {
  const MyProgressIndicatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: context.sizeHeight(100),
        constraints: const BoxConstraints.expand(),
        decoration:
            const BoxDecoration(color: Color.fromARGB(100, 105, 105, 105)),
        child: FittedBox(
          fit: BoxFit.none,
          child: SizedBox(
            height: context.sizeHeight(100),
            width: context.sizeHeight(100),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(context.sizeWidth(10))),
              child: const Padding(
                padding: EdgeInsets.all(25.0),
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
