class ProtectedMaterialText {
  bool? filtered;
  bool? detected;

  ProtectedMaterialText({this.filtered, this.detected});

  factory ProtectedMaterialText.fromJson(Map<String, dynamic> json) {
    return ProtectedMaterialText(
      filtered: json['filtered'] as bool?,
      detected: json['detected'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'filtered': filtered,
        'detected': detected,
      };
}
