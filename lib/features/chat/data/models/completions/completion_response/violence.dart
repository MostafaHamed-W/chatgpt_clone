class Violence {
  bool? filtered;
  String? severity;

  Violence({this.filtered, this.severity});

  factory Violence.fromJson(Map<String, dynamic> json) => Violence(
        filtered: json['filtered'] as bool?,
        severity: json['severity'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'filtered': filtered,
        'severity': severity,
      };
}
