
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/Starter_create_controller.dart';

class StarterCreatePage extends StatefulWidget {
  final bool isUpdate;
  final int? postId;
  final String? title;
  final String? body;
  const StarterCreatePage(
      {super.key, required this.isUpdate, this.postId, this.title, this.body});

  @override
  State<StarterCreatePage> createState() => _StarterCreatePageState();
}

class _StarterCreatePageState extends State<StarterCreatePage> {

  final _controller = Get.put(StarterCreateController());

  @override
  void initState() {


    _controller.titleController = widget.isUpdate
        ? TextEditingController(text: widget.title)
        : TextEditingController(text: '');

    _controller.bodyController = widget.isUpdate
        ? TextEditingController(text: widget.body)
        : TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: GetBuilder(
        init: StarterCreateController(),
        builder: (controller){
          return Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 40),
                          TextField(
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontWeight: FontWeight.w500),
                            controller: controller.titleController,
                            cursorColor: Colors.black54,
                            textAlignVertical: TextAlignVertical.top,
                            textAlign: TextAlign.start,
                            maxLines: 5,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.8),
                                contentPadding: const EdgeInsets.all(5),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                  borderSide:
                                  BorderSide(width: 2, color: Colors.grey),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                                  borderSide:
                                  BorderSide(width: 2, color: Colors.black54),
                                ),
                                alignLabelWithHint: true,
                                labelText: 'Title',
                                labelStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ))),
                          ),
                          const SizedBox(height: 50),
                          TextField(
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontWeight: FontWeight.w500),
                            controller: controller.bodyController,
                            cursorColor: Colors.black54,
                            textAlignVertical: TextAlignVertical.top,
                            textAlign: TextAlign.start,
                            maxLines: 5,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.8),
                                contentPadding: const EdgeInsets.all(5),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                  borderSide:
                                  BorderSide(width: 2, color: Colors.grey),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                                  borderSide:
                                  BorderSide(width: 2, color: Colors.black54),
                                ),
                                alignLabelWithHint: true,
                                labelText: 'Body',
                                labelStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ))),
                          ),
                          const SizedBox(height: 100),
                          MaterialButton(
                            color: Colors.blueAccent.shade100,
                            shape: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.blueAccent.shade200),
                                borderRadius: BorderRadius.circular(10)),
                            height: 50,
                            minWidth: 200,
                            onPressed: () {
                              controller.doPostCreate(context, widget.postId, widget.isUpdate);
                            },
                            child: widget.isUpdate
                                ? const Text('Update Post')
                                : const Text('Create Post'),
                          ),
                        ],
                      ),
                    ],
                  )),
              controller.isLoading
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : const SizedBox.shrink(),
            ],
          );
        },
      )
    );
  }
}
