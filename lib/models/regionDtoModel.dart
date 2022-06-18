import 'dart:convert';
RegionDtoModel regionDtoModelFromJson(String str) => RegionDtoModel.fromJson(json.decode(str));
String regionDtoModelToJson(RegionDtoModel data) => json.encode(data.toJson());
class RegionDtoModel {
  RegionDtoModel({
      this.success, 
      this.message, 
      this.regionDto,
      this.totalElements,});

  RegionDtoModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    if (json['object'] != null) {
      regionDto = [];
      json['object'].forEach((v) {
        regionDto?.add(RegionDto.fromJson(v));
      });
    }
    totalElements = json['totalElements'];
  }
  bool? success;
  String? message;
  List<RegionDto>? regionDto;
  int? totalElements;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (regionDto != null) {
      map['object'] = regionDto?.map((v) => v.toJson()).toList();
    }
    map['totalElements'] = totalElements;
    return map;
  }

}

RegionDto regionDtoFromJson(String str) => RegionDto.fromJson(json.decode(str));
String regionDtoToJson(RegionDto data) => json.encode(data.toJson());
class RegionDto {
  RegionDto({
      this.id, 
      this.name,});

  RegionDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}