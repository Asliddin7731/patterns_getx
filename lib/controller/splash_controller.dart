
import 'package:get/get.dart';

import '../model/post_model.dart';
import '../service/http_service.dart';

class SplashController extends GetxController{
  var isLoading = false.obs;
  var items = [].obs;

  void apiPostList() async {
      isLoading.value = true;
    var response = await Network.GET(Network.apiList, Network.paramsEmpty());

      if (response != null) {
        items.value = Network.parsePostList(response);
      } else {
        items.value = [];
      }
      isLoading.value = false;
  }

  void apiPostDelete(Post post) async {
      isLoading.value = true;
    var response = await Network.DEl(
        Network.apiDelete + post.id.toString(), Network.paramsEmpty());
      if (response != null) {
        apiPostList();
      }
      isLoading.value = false;
  }

}