import 'dart:convert';
import 'package:dio/dio.dart';

import 'inter_service.dart';

/// This service will change later
class NetworkService {
  static bool isTester = true;
  static Dio dio = Dio(_baseDioOptions)..interceptors.add(DioInterceptor());

  static String SERVER_DEVELOPMENT = "https://api.unsplash.com";
  static String SERVER_PRODUCTION = "https://api.unsplash.com";

  /* Dio Apis */
  static String API_LIST = "/photos";
  static String API_DELETE = "/photos/"; //{id}

  static Map<String, String> get headers {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept-Version': 'v1',
      // 'Accept': 'application/json',
      // 'Authorization': 'Client-ID zYGJr9DhtNKBrx-M5SL9b4QJe3j9kxXlYQtZVB10st8',
      // 'App-OS': Platform.operatingSystem,
      // 'App-Language': LangService.locale.languageCode,
    };
    return headers;
  }

  static String get baseApiUrl {
    if (isTester) return SERVER_DEVELOPMENT;
    return SERVER_PRODUCTION;
  }

  static final BaseOptions _baseDioOptions = BaseOptions(
    baseUrl: baseApiUrl,
    headers: headers,
    connectTimeout: 40000,
    receiveTimeout: 40000,
    contentType: 'application/json',
    responseType: ResponseType.json,
  );

  /* Dio Requests */
  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    Response response = await dio.get(api, queryParameters: params);
    if (response.statusCode == 200) {
      return jsonEncode(response.data);
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    Response response = await dio.post(api, data: params);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonEncode(response.data);
    }
    return null;
  }

  static Future<String?> MULTIPART(String api, String path) async {
    Response response = await dio.post(api, data: {
      "file":await MultipartFile.fromFile(path, filename: "test")
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonEncode(response.data);
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, dynamic> params) async {
    Response response = await dio.put(api, data: params);// http or https
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonEncode(response.data);
    }
    return null;
  }

  static Future<String?> PATCH(String api, Map<String, dynamic> params) async {
    Response response = await dio.patch(api, data: params);// http or https
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonEncode(response.data);
    }
    return null;
  }

  static Future<String?> DELETE(String api, Map<String, dynamic> params) async {
    Response response = await dio.delete(api, data: params);// http or https
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonEncode(response.data);
    }
    return null;
  }


  /* Dio Params */
  // static Map<String, dynamic> paramsEmpty() {
  //   Map<String, String> params = {};
  //   return params;
  // }
  //
  // static Map<String, dynamic> paramsPage(int pageNumber) {
  //   Map<String, String> params = {};
  //   params.addAll({"page": pageNumber.toString()});
  //   return params;
  // }
  //
  // static Map<String, dynamic> paramsSearch(String search, int pageNumber) {
  //   Map<String, String> params = {};
  //   params.addAll({"page": pageNumber.toString(), "query": search});
  //   return params;
  // }

  /* Dio body */
  // static Map<String, dynamic> bodyCreate(Object object) {
  //   Map<String, dynamic> body = {};
  //   body.addAll(object.toJson());
  //   return body;
  // }
  //
  // static Map<String, dynamic> paramsUpdate(Object object) {
  //   Map<String, dynamic> body = {};
  //   body.addAll(object.toJson());
  //   return body;
  // }

  /* Dio parsing */
  // static List<Object> parseResponse(String response) {
  //   List json = jsonDecode(response);
  //   List<Object> objects = List<Object>.from(json.map((x) => Object.fromJson(x)));
  //   return objects;
  // }

  /// Exception bilan handle qilinadi
}