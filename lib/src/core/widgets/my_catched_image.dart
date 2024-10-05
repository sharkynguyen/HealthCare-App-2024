import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/src/core/theme/assets.gen.dart';

class MyCachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? opacity;
  final Widget? errorWidget;

  const MyCachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.borderRadius,
    this.opacity,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        fit: BoxFit.cover,
        width: width,
        height: height,
        imageUrl: imageUrl.isNotEmpty
            ? imageUrl
            : 'https://www.investopedia.com/thmb/pevv6dw9Hn-DK8L2tUmmyLXvcpw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/CryptoSpotlight-Recirc2-52a72e7b82124c83b1818c6f4fa14344.jpg',
        // imageBuilder: (context, imageProvider) => Container(
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(borderRadius ?? 5),
        //         image: DecorationImage(
        //           image: imageProvider,
        //           fit: BoxFit.cover,
        //           opacity: opacity ?? 1,
        //         ),
        //       ),
        //     ),
        // placeholder: (context, url) => MyShimmer(count: 1, height: height),
        errorWidget: (context, url, error) =>
            errorWidget ?? Assets.images.logoApp.image());
  }
}
