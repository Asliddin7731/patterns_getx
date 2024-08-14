import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/controller/starter_controller.dart';
import 'package:patterns_getx/pages/starter_create_page.dart';
import '../model/post_model.dart';
import '../views/item_starter_post.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({super.key});

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {

  final _controller = Get.put(StarterController());

  @override
  void initState() {
    super.initState();
    Get.find<StarterController>().apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text('GetX'),
      ),
      body: GetBuilder(
        init: StarterController(),
        builder: (controller){
          return Stack(
            children: [
              ListView.builder(
                  itemCount: controller.items.length,
                  itemBuilder: (ctx, index) {
                    Post post = controller.items[index];
                    return itemStarterPost(controller, post);
                  }),
              controller.isLoading
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : const SizedBox.shrink(),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        foregroundColor: Colors.white,
        onPressed: () async {
          bool? isUpdate = await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const StarterCreatePage(isUpdate: false)));
          if (isUpdate != null) {
            _controller.apiPostList();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
