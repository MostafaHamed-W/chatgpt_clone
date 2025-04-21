class Jailbreak {
  bool? filtered;
  bool? detected;

  Jailbreak({this.filtered, this.detected});

  factory Jailbreak.fromJson(Map<String, dynamic> json) => Jailbreak(
        filtered: json['filtered'] as bool?,
        detected: json['detected'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'filtered': filtered,
        'detected': detected,
      };
}
