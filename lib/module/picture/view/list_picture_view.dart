import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectids/core.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ListPictureController controller = Get.put(ListPictureController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List Photo',
        ),
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(child: LoadingWidget());
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: controller.pictureList.length,
            itemBuilder: (context, index) {
              final picture = controller.pictureList[index];
              return GestureDetector(
                onTap: () {
                  controller.toDetailPage(picture);
                },
                child: ListContentWidget(
                  imageUrl: picture['download_url'],
                  author: picture['author'],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
