import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/main_controller.dart';
import '../model/post_model.dart';
import '../views/item_main_post.dart';
import 'create_page.dart';

class MainPage extends StatefulWidget {
  static const String id = '/main_page';
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _HMainPageState();
}

class _HMainPageState extends State<MainPage> {

  @override
  void initState() {
    super.initState();
    Get.find<MainController>().apiPostList();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text('GetX'),
      ),
      body: Obx(
          ()=> Stack(
            children: [
              ListView.builder(
                  itemCount: Get.find<MainController>().items.length,
                  itemBuilder: (ctx, index) {
                    Post post = Get.find<MainController>().items[index];
                    return itemMainPost(Get.find<MainController>(), post);
                  }),
              Get.find<MainController>().isLoading.value
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : const SizedBox.shrink(),
            ],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        onPressed: () async {
          bool? isUpdate = await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CreatePage(isUpdate: false)));
          if (isUpdate != null) {
            Get.find<MainController>().apiPostList();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
