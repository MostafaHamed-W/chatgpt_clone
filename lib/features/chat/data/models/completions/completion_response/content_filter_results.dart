import 'hate.dart';
import 'protected_material_code.dart';
import 'protected_material_text.dart';
import 'self_harm.dart';
import 'sexual.dart';
import 'violence.dart';

class ContentFilterResults {
  Hate? hate;
  ProtectedMaterialCode? protectedMaterialCode;
  ProtectedMaterialText? protectedMaterialText;
  SelfHarm? selfHarm;
  Sexual? sexual;
  Violence? violence;

  ContentFilterResults({
    this.hate,
    this.protectedMaterialCode,
    this.protectedMaterialText,
    this.selfHarm,
    this.sexual,
    this.violence,
  });

  factory ContentFilterResults.fromJson(Map<String, dynamic> json) {
    return ContentFilterResults(
      hate: json['hate'] == null
          ? null
          : Hate.fromJson(json['hate'] as Map<String, dynamic>),
      protectedMaterialCode: json['protected_material_code'] == null
          ? null
          : ProtectedMaterialCode.fromJson(
              json['protected_material_code'] as Map<String, dynamic>),
      protectedMaterialText: json['protected_material_text'] == null
          ? null
          : ProtectedMaterialText.fromJson(
              json['protected_material_text'] as Map<String, dynamic>),
      selfHarm: json['self_harm'] == null
          ? null
          : SelfHarm.fromJson(json['self_harm'] as Map<String, dynamic>),
      sexual: json['sexual'] == null
          ? null
          : Sexual.fromJson(json['sexual'] as Map<String, dynamic>),
      violence: json['violence'] == null
          ? null
          : Violence.fromJson(json['violence'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'hate': hate?.toJson(),
        'protected_material_code': protectedMaterialCode?.toJson(),
        'protected_material_text': protectedMaterialText?.toJson(),
        'self_harm': selfHarm?.toJson(),
        'sexual': sexual?.toJson(),
        'violence': violence?.toJson(),
      };
}
