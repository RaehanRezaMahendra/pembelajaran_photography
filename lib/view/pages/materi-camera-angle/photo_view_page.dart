import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewPage extends StatelessWidget {
  final int initialIndex;
  final List<String> images;

  const PhotoViewPage({
    super.key,
    required this.initialIndex,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preview Image"),
      ),
      body: PhotoViewGallery.builder(
        pageController: PageController(
          initialPage: initialIndex,
        ),
        scrollPhysics: const BouncingScrollPhysics(),
        itemCount: images.length,
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(images[index]),
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return const SizedBox();
            },
          );
        },
      ),
    );
  }
}
