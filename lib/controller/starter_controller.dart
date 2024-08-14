
import 'package:get/get.dart';

import '../model/post_model.dart';
import '../service/http_service.dart';

class StarterController extends GetxController{
  var isLoading = false;
  var items = [];

  void apiPostList() async {
      isLoading = true;
      update();
    var response = await Network.GET(Network.apiList, Network.paramsEmpty());

      if (response != null) {
        items = Network.parsePostList(response);
      } else {
        items = [];
      }
      isLoading = false;
      update();
  }

  void apiPostDelete(Post post) async {
      isLoading = true;
      update();
    var response = await Network.DEl(
        Network.apiDelete + post.id.toString(), Network.paramsEmpty());
      if (response != null) {
        apiPostList();
      }
      isLoading = false;
      update();
  }

}