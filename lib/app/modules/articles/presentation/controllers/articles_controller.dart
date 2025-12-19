import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/articles/data/articles_data_sources.dart';
import 'package:here_for_you_app/app/modules/articles/presentation/states/articles_state.dart';
import 'package:here_for_you_app/common/utils/snackbars.dart';

import '../../../../../common/utils/helpers.dart';

class ArticlesController extends GetxController {
  ArticlesDataSources dataSources;
  ArticlesState state;

  ArticlesController({required this.dataSources, required this.state});

  @override
  void onInit() {
    super.onInit();
    state.isDataLoading.value = true;
    getData();
  }

  void onTap(String link) {
    try {
      Helpers.openUrl(url: link);
    } catch (e) {
      Snackbars.error(
        title: "Oops!",
        message: "Couldn't open the link. Try opening it in your browser.",
      );
    }
  }

  Future<void> getData() async {
    final result = await dataSources.getData();
    result.fold((error) {}, (data) {
      state.articles.value = data;
    });
    await Future.delayed(const Duration(seconds: 1));
    state.isDataLoading.value = false;
  }
}
