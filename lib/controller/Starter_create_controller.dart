
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/post_model.dart';
import '../service/http_service.dart';
import '../service/log_service.dart';

class StarterCreateController extends GetxController {
  var isLoading = false;
  var titleController = TextEditingController();
  var bodyController = TextEditingController();

  Future doPostCreate(BuildContext context, int? postId, isUpdate)async {
    String title = titleController.text.toString().trim();
    String body = bodyController.text.toString().trim();

    if (title.isEmpty || body.isEmpty) return;

      isLoading = true;
      update();

    var post = Post(userId: 1, title: title, body: body);
    var post2 = Post(userId: 1, title: title, body: body, id: postId);

    isUpdate ? await apiPostUpdate(post2) : await apiPostCreate(post);
    Navigator.pop(context, true);
  }

  Future<void> apiPostCreate(Post post) async {
    Network.POST(Network.apiCreate, Network.paramsCreate(post))
        .then((response) => {
        isLoading = false
    });
    update();
  }

  Future<void> apiPostUpdate(Post post) async {
    Network.PUT(
        Network.apiUpdate + post.id.toString(), Network.paramsUpdate(post))
        .then((response) => {
      LogService.e('update : $response'),
        isLoading = false
    });
    update();
  }
}