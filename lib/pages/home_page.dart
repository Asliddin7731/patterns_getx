import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/controller/home_controller.dart';

import '../model/post_model.dart';
import '../views/item_home_post.dart';
import 'create_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 final _controller = Get.put(HomeController());

  @override
  void initState() {
    _controller.apiPostList();
    super.initState();
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
                  itemCount: _controller.items.length,
                  itemBuilder: (ctx, index) {
                    Post post = _controller.items[index];
                    return itemOfPost(_controller, post);
                  }),
              _controller.isLoading.value
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
            _controller.apiPostList();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
