import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ImageCahed extends StatelessWidget {
  final String image;
  final bool cah;
  const ImageCahed({Key key, this.image, this.cah=true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      image,
      loadStateChanged: (e) {
        if (e.extendedImageLoadState == LoadState.failed) {
          return Icon(Icons.image_not_supported_outlined);
        } else if (e.extendedImageLoadState == LoadState.loading) {
          return Center(child: Lottie.asset(
          'assets/lottie/loading.json',
          fit: BoxFit.contain,
          alignment: Alignment.center,
          height: 30,
          width: 30
        ),);
        }
      },
      fit: BoxFit.cover,
      cache: cah,
      // width: double.infinity,
    );
  }
}
