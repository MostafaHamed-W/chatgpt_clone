class ProtectedMaterialCode {
  bool? filtered;
  bool? detected;

  ProtectedMaterialCode({this.filtered, this.detected});

  factory ProtectedMaterialCode.fromJson(Map<String, dynamic> json) {
    return ProtectedMaterialCode(
      filtered: json['filtered'] as bool?,
      detected: json['detected'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'filtered': filtered,
        'detected': detected,
      };
}
