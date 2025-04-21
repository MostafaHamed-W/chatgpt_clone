class Hate {
  bool? filtered;
  String? severity;

  Hate({this.filtered, this.severity});

  factory Hate.fromJson(Map<String, dynamic> json) => Hate(
        filtered: json['filtered'] as bool?,
        severity: json['severity'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'filtered': filtered,
        'severity': severity,
      };
}
