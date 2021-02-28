import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

class SklHttp {
  Dio dio;
  BaseOptions options;
  static SklHttp _instance;

  SklHttp._internal(){
    //BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    options = BaseOptions(
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 10000,
      //响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: 5000,
      //请求的Content-Type，默认值是"application/json; charset=utf-8",Headers.formUrlEncodedContentType会自动编码请求体.
      contentType: Headers.jsonContentType,
      //表示期望以那种格式(方式)接受响应数据。接受四种类型 `json`, `stream`, `plain`, `bytes`. 默认值是 `json`,
      responseType: ResponseType.json,
    );

    dio = Dio(options);

    //Cookie管理
    dio.interceptors.add(CookieManager(CookieJar()));

    //添加拦截器
    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print("请求之前");
      // print(jsonEncode(options));
      return options; //continue
    }, onResponse: (Response response) {
      print("响应之前");
      print(response);
      return response; // continue
    }, onError: (DioError e) {
      print("错误之前");
      return e; //continue
    }));
  }

  factory SklHttp() => _getInstance();

  static SklHttp get instance => _getInstance();

  static SklHttp _getInstance() {
    if (_instance == null) {
      _instance = SklHttp._internal();
    }
    return _instance;
  }
  
  /*
   * post请求
   */
  Future<Response> post(url, data) async {
    print(CookieJar().loadForRequest(Uri.parse(url)));
    print("post请求------------------------------");
    print(data);
    Response response;
    try {
      response = await dio.post(url, data: data);
      print('post success---------${response.data}');
    } on DioError catch (e) {
      print('post error---------$e');
      formatError(e);
    }
    return response;
  }

  /*
   * error统一处理
   */
  void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      // It occurs when url is opened timeout.
      print("连接超时");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      // It occurs when url is sent timeout.
      print("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      //It occurs when receiving timeout
      print("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      // When the server response, but with a incorrect status, such as 404, 503...
      print("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      // When the request is cancelled, dio will throw a error with this type.
      print("请求取消");
    } else {
      //DEFAULT Default error type, Some other Error. In this case, you can read the DioError.error if it is not null.
      print("未知错误");
    }
  }
}