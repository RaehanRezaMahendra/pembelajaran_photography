import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pembelajaran_photography/common/get_thumbnail_youtube.dart';
import 'package:url_launcher/url_launcher.dart';

class YouTubeThumbnail extends StatelessWidget {
  final String videoUrl;

  const YouTubeThumbnail({
    super.key,
    required this.videoUrl,
  });

  Future<void> _launchURL() async {
    if (!await launchUrl(Uri.parse(videoUrl))) {
      throw Exception('Tidak dapat membuka $videoUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: getThumbnailYoutube(videoUrl),
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              padding: const EdgeInsets.all(40.0),
              child: const CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.lightGreen,
            ),
            child: TextButton.icon(
              onPressed: () => _launchURL(),
              icon: const Icon(
                Icons.play_circle,
                color: Colors.red,
              ),
              label: const Text(
                "Tonton Video",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
