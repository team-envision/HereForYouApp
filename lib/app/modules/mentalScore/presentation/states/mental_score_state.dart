import 'package:get/get.dart';

class MentalScoreState extends GetXState {
  String? key;
  List<String> leftLabels = ["0", "20", "40", "60", "80", "100"];
  RxList<double> values = <double>[5, 10, 15, 20, 25, 30, 35].obs;
  RxBool isDataLoading = false.obs;
  RxInt score = 0.obs;
}
