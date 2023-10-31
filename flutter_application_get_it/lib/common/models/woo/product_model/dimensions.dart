class Dimensions {
  String? length;
  String? width;
  String? height;

  Dimensions({this.length, this.width, this.height});

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        length: json['length'] as String?,
        width: json['width'] as String?,
        height: json['height'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'length': length,
        'width': width,
        'height': height,
      };
}
