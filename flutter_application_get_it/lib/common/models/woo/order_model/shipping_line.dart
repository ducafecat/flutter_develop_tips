class ShippingLine {
  int? id;
  String? methodTitle;
  String? methodId;
  String? instanceId;
  String? total;
  String? totalTax;
  List<dynamic>? taxes;
  List<dynamic>? metaData;

  ShippingLine({
    this.id,
    this.methodTitle,
    this.methodId,
    this.instanceId,
    this.total,
    this.totalTax,
    this.taxes,
    this.metaData,
  });

  factory ShippingLine.fromJson(Map<String, dynamic> json) => ShippingLine(
        id: json['id'] as int?,
        methodTitle: json['method_title'] as String?,
        methodId: json['method_id'] as String?,
        instanceId: json['instance_id'] as String?,
        total: json['total'] as String?,
        totalTax: json['total_tax'] as String?,
        taxes: json['taxes'] as List<dynamic>?,
        metaData: json['meta_data'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'method_title': methodTitle,
        'method_id': methodId,
        'instance_id': instanceId,
        'total': total,
        'total_tax': totalTax,
        'taxes': taxes,
        'meta_data': metaData,
      };
}
