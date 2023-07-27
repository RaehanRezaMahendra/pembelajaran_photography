import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pembelajaran_photography/common/images.dart';
import 'package:pembelajaran_photography/model/materi_camera_angle_model.dart';
import 'package:pembelajaran_photography/view/pages/materi-camera-angle/photo_view_page.dart';

class MateriCameraAngleDetailPage extends StatelessWidget {
  final MateriCameraAngleModel materi;

  const MateriCameraAngleDetailPage({
    super.key,
    required this.materi,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Baca Materi"),
        actions: [
          Image.asset(AppImages.logo),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Center(
            child: Text(
              materi.title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.0,
              crossAxisCount: 2,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
            ),
            itemCount: materi.images.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PhotoViewPage(
                        initialIndex: index,
                        images: materi.images,
                      ),
                    )),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: CachedNetworkImage(
                    imageUrl: materi.images[index],
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      padding: const EdgeInsets.all(40.0),
                      child: const CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(materi.materi),
          const SizedBox(
            height: 50.0,
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
        ),
        onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
        child: const Text(
          "Selesai",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
