
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../controller/home_controller.dart';
import '../model/post_model.dart';
import '../pages/create_page.dart';

Widget itemOfPost(HomeController controller, Post post) {
  return Slidable(
    startActionPane: ActionPane(
      dragDismissible: false,
      motion: const ScrollMotion(),
      dismissible: DismissiblePane(
        onDismissed: () {},
      ),
      children: [
        SlidableAction(
          onPressed: (BuildContext context)async {
            bool? isUpdate = await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CreatePage(
                isUpdate: true,
                postId: post.id,
                title: post.title,
                body: post.body,
              ),
            ));
            if(isUpdate != null){
              controller.apiPostList();
            }
          },
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: 'Update',
        )
      ],
    ),
    endActionPane: ActionPane(
      dragDismissible: false,
      motion: const ScrollMotion(),
      dismissible: DismissiblePane(
        onDismissed: () {},
      ),
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            controller.apiPostDelete(post);
          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        )
      ],
    ),
    child: Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.title!.toUpperCase()),
          const SizedBox(height: 5),
          Text(post.body!),
        ],
      ),
    ),
  );
}