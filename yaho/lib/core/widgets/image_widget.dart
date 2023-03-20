import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yaho/core/widgets/loading_widget.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;

  const ImageWidget({
    super.key,
    required this.imageUrl,
    this.width = 40.0,
    this.height = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      placeholder: (context, url) => const LoadingWidget(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            // fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              Colors.transparent,
              BlendMode.colorBurn,
            ),
          ),
        ),
      ),
    );
  }
}
