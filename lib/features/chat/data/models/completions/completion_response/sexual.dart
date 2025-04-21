class Sexual {
  bool? filtered;
  String? severity;

  Sexual({this.filtered, this.severity});

  factory Sexual.fromJson(Map<String, dynamic> json) => Sexual(
        filtered: json['filtered'] as bool?,
        severity: json['severity'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'filtered': filtered,
        'severity': severity,
      };
}
