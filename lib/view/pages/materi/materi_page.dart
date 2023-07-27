import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pembelajaran_photography/common/images.dart';
import 'package:pembelajaran_photography/model/materi_model.dart';
import 'package:pembelajaran_photography/service/materi_service.dart';
import 'package:pembelajaran_photography/view/pages/materi/materi_detail_page.dart';

class MateriPage extends StatefulWidget {
  const MateriPage({super.key});

  @override
  State<MateriPage> createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {
  final MateriService materiService = MateriService();
  List<MateriModel> datas = [];

  void getMateri() async {
    datas = await materiService.getMateri();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getMateri();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Materi"),
        actions: [
          Image.asset(AppImages.logo),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: datas.length,
        itemBuilder: (context, index) => Card(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.deepPurple[200],
            ),
            child: ListTile(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MateriDetailPage(materi: datas[index]),
                  )),
              title: Text(datas[index].title),
              subtitle: Text(
                datas[index].materi,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  imageUrl: datas[index].images[0],
                  width: 60.0,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    padding: const EdgeInsets.all(40.0),
                    child: const CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
        ).animate(delay: (int.parse("${index}00")).ms).fadeIn(),
      ),
    );
  }
}
