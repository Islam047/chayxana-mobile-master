import 'dart:convert';
import 'package:chayxana/services/log_service.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

class NetworkService {
  static bool isTester = true;

  static String SERVER_DEVELOPMENT = "62.109.0.156:8085";
  static String SERVER_PRODUCTION = "62.109.0.156:8085";

  /* Dio Apis */
  static String API_HISTORY_LIST = "/api/v1/mobile/order/orders/by/userId/";
  static String API_DELETE = "/photos/"; //{id}
  static String API_CHAYXANALAR = "/api/v1/mobile/chayxana/address";
  static String API_PROFILE_IMAGE_FROM_ID = "/api/v1/mobile/chayxana/getMainPicOfChayxana/"; //{id}
  static String API_PROFILE_ICON_FROM_ID = "/api/v1/mobile/icon/"; //id
  static String API_PROFILE_RATE_FROM_ID = "/api/v1/rate/{id}?id="; //!id
  static String API_MY_DATA = '/api/v1/mobile/user/getUserById';


  static Map<String, String> getHeaders() {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept-Version': 'v1'
    };
    return headers;
  }

  static Map<String, String> getUploadHeaders() {
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data'
    };
    return headers;
  }

  static String getServer() {
    if (isTester) return SERVER_DEVELOPMENT;
    return SERVER_PRODUCTION;
  }

  /* Http Requests */
  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    var uri = Uri.http(getServer(), api, params); // http or https
    var response = await get(uri, headers: getHeaders());
    LogService.wtf("Api: $api;\nResponse: ${response.body}");
    if (response.statusCode == 200) return response.body;
    return null;
  }

  static Future<String?> MULTIPART(
      String api, String filePath, Map<String, String> body) async {
    var uri = Uri.https(getServer(), api);
    var request = MultipartRequest('POST', uri);
    request.headers.addAll(getUploadHeaders());
    request.files.add(await MultipartFile.fromPath('file', filePath,
        contentType: MediaType("image", "jpeg")));
    request.fields.addAll(body);
    StreamedResponse response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201) {
      return await response.stream.bytesToString();
    } else {
      return response.reasonPhrase;
    }
  }

  static Future<String?> DELETE(String api, String id) async {
    var uri = Uri.https(getServer(), api + id, {}); // http or https
    var response = await delete(uri, headers: getUploadHeaders());
    if (response.statusCode == 200) return response.body;
    return null;
  }

  static Future<String?> POST(String api, Map<String, dynamic> body) async {
    var uri = Uri.https(getServer(), api);
    Response response = await post(uri, headers: getHeaders(), body: jsonEncode(body));
    LogService.wtf("Api: $api;\nResponse: ${response.body}");
    if(response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params, Map<String, String> body) async {
    var uri = Uri.https(getServer(), api, params);
    Response response = await put(uri, headers: getHeaders(), body: jsonEncode(body));
    LogService.wtf("Api: $api;\nResponse: ${response.body}");
    if(response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PATCH(String api, Map<String, String> body) async {
    var uri = Uri.https(getServer(), api);
    Response response = await patch(uri, headers: getHeaders(), body: jsonEncode(body));
    LogService.wtf("Api: $api;\nResponse: ${response.body}");
    if(response.statusCode == 200) {
      return response.body;
    }
    return null;
  }



/* Http Body */
// static Map<String, String> bodyUpload(String subId) {
//   Map<String, String> body = {'sub_id': subId};
//   return body;
// }

/* Http Params */
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

    static Map<String, dynamic> paramsUser(String id) {
      Map<String, String> params = {};
      params.addAll({'id': id});
      return params;
    }
//
// static Map<String, dynamic> paramsSearch(String search, int pageNumber) {
//   Map<String, String> params = {};
//   params.addAll(
//       {'breed_ids': search, 'limit': '25', 'page': pageNumber.toString()});
//   return params;
// }
//
// static Map<String, dynamic> paramsBreedSearch(String search) {
//   Map<String, String> params = {};
//   params.addAll({'q': search});
//   return params;
// }
//
// /* Http parsing */
// static List<Cat> parseResponse(String response) {
//   List json = jsonDecode(response);
//   List<Cat> photos = List<Cat>.from(json.map((x) => Cat.fromJson(x)));
//   return photos;
// }
//
// static List<Breeds> parseSearchBreed(String response) {
//   List json = jsonDecode(response);
//   List<Breeds> categories = List<Breeds>.from(json.map((x) => Breeds.fromJson(x)));
//   return categories;
// }
}