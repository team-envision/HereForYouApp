class OptionModel {
  final String label;
  final String icon;

  OptionModel({required this.label, required this.icon});

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(label: json['label'] ?? "", icon: json['icon'] ?? "");
  }
}
