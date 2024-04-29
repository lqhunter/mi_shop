import 'package:dio/dio.dart';

class HttpsClient {

  HttpsClient._internal() {
    dio.options.baseUrl = domain;
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 5000;
  }

  static final HttpsClient _client = HttpsClient._internal();

  factory HttpsClient() => _client;

  static String domain = "https://miapp.itying.com/";
  static Dio dio = Dio();


  Future<Response<T>> get<T>(apiUrl) async {
      var response = await dio.get<T>(apiUrl);
      return response;
  }

  //加载网络图片
  static replaeUri(picUrl){
    String tempUrl=domain+picUrl;
    return tempUrl.replaceAll("\\", "/");
  }

  Future post(String apiUrl,{Map? data}) async {
    try {
      var response = await dio.post(apiUrl,data:data);
      return response;
    } catch (e) {
      print("请求超时");
      return null;
    }
  }
}

