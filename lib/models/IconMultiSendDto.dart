import 'dart:convert';

IconMultiSendDto iconMultiSendDtoFromJson(String str) => IconMultiSendDto.fromJson(json.decode(str));

String iconMultiSendDtoToJson(IconMultiSendDto data) => json.encode(data.toJson());

class IconMultiSendDto {
  String? bytes;
  String? contentType;
  String? fileOriginalName;
  String? id;
  String? name;
  int? size;

  IconMultiSendDto({
    this.bytes,
    this.contentType,
    this.fileOriginalName,
    this.id,
    this.name,
    this.size,
  });

  IconMultiSendDto.fromJson(dynamic json) {
    bytes = json['bytes'];
    contentType = json['contentType'];
    fileOriginalName = json['fileOriginalName'];
    id = json['id'];
    name = json['name'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bytes'] = bytes;
    map['contentType'] = contentType;
    map['fileOriginalName'] = fileOriginalName;
    map['id'] = id;
    map['name'] = name;
    map['size'] = size;
    return map;
  }
}
