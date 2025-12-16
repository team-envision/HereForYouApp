import 'package:get/get.dart';
import 'package:here_for_you_app/common/models/article.dart';

class ArticlesState extends GetXState {
  RxBool isDataLoading = true.obs;
  RxList<ArticleModel> articles = <ArticleModel>[].obs;
}
