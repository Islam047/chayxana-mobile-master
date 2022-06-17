import 'dart:convert';
ApiResponse apiResponseFromJson(String str) => ApiResponse.fromJson(json.decode(str));
String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());
class ApiResponse {
  ApiResponse({
      this.success, 
      this.message, 
      this.user, 
      this.totalElements,});

  ApiResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    user = json['object'] != null ?  User.fromJson(json['object']) : null;
    totalElements = json['totalElements'];
  }
  bool? success;
  String? message;
  User? user;
  int? totalElements;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (user != null) {
      map['object'] = user?.toJson();
    }
    map['totalElements'] = totalElements;
    return map;
  }

}

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      this.id, 
      this.fullName, 
      this.phoneNumber, 
      this.roleDto, 
      this.addressDto, 
      this.language, 
      this.imageUrl, 
      this.spamTime, 
      this.createdAt,});

  User.fromJson(dynamic json) {
    id = json['id'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    roleDto = json['roleDto'] != null ? RoleDto.fromJson(json['roleDto']) : null;
    addressDto = json['addressDto'];
    language = json['language'];
    imageUrl = json['imageUrl'];
    spamTime = json['spamTime'];
    createdAt = json['createdAt'];
  }
  String? id;
  String? fullName;
  String? phoneNumber;
  RoleDto? roleDto;
  dynamic addressDto;
  String? language;
  String? imageUrl;
  dynamic spamTime;
  dynamic createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['fullName'] = fullName;
    map['phoneNumber'] = phoneNumber;
    if (roleDto != null) {
      map['roleDto'] = roleDto?.toJson();
    }
    map['addressDto'] = addressDto;
    map['language'] = language;
    map['imageUrl'] = imageUrl;
    map['spamTime'] = spamTime;
    map['createdAt'] = createdAt;
    return map;
  }

}

RoleDto roleDtoFromJson(String str) => RoleDto.fromJson(json.decode(str));
String roleDtoToJson(RoleDto data) => json.encode(data.toJson());
class RoleDto {
  RoleDto({
      this.id, 
      this.roleName,});

  RoleDto.fromJson(dynamic json) {
    id = json['id'];
    roleName = json['roleName'];
  }
  int? id;
  String? roleName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['roleName'] = roleName;
    return map;
  }

}