class SelfHarm {
  bool? filtered;
  String? severity;

  SelfHarm({this.filtered, this.severity});

  factory SelfHarm.fromJson(Map<String, dynamic> json) => SelfHarm(
        filtered: json['filtered'] as bool?,
        severity: json['severity'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'filtered': filtered,
        'severity': severity,
      };
}
