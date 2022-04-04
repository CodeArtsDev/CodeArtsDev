import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kalyana_gadiya/api/core/connectivity_helper.dart';
import 'package:kalyana_gadiya/api/core/types.dart';
import 'dart:convert';
import '../models/base.dart';

class ApiConfig {
  final String url;
  final bool authRequired;

  ApiConfig(this.url, {this.authRequired = true});
}

class BaseRepository<T extends BaseModel> {
  final ApiConfig apiConfig;
  final ModelCreator<T> modelCreator;
  final ModelListCreator<T> modelListCreator;
  late IHttpAdapter httpAdapter;

  BaseRepository(this.apiConfig, this.modelCreator, this.modelListCreator,
      {IHttpAdapter? httpAdapter}) {
    httpAdapter = httpAdapter ?? GetIt.instance<IHttpAdapter>();
  }

  Future<T> get(dynamic id, {Map<String, String>? headers}) async {
    headers = await headers.addCommonHeaders(apiConfig.authRequired);
    var result =
        await httpAdapter.get("${apiConfig.url}/$id", modelCreator, headers);
    return result;
  }

  Future<List<T>> getAll({Map<String, String>? headers}) async {
    headers = await headers.addCommonHeaders(apiConfig.authRequired);
    var result =
        await httpAdapter.get(apiConfig.url, modelListCreator, headers);
    return result;
  }

  Future<T> create(T body, {Map<String, String>? headers}) async {
    headers = await headers.addCommonHeaders(apiConfig.authRequired);
    var result =
        await httpAdapter.post(apiConfig.url, body, modelCreator, headers);
    return result;
  }

  Future<T> update(T body, {Map<String, String>? headers}) async {
    headers = await headers.addCommonHeaders(apiConfig.authRequired);
    var result =
        await httpAdapter.put(apiConfig.url, body, modelCreator, headers);
    return result;
  }

  Future delete(dynamic id, {Map<String, String>? headers}) async {
    headers = await headers.addCommonHeaders(apiConfig.authRequired);
    await httpAdapter.delete("${apiConfig.url}/$id", headers);
  }
}

abstract class IHttpAdapter {
  Future<T> get<T>(
      String url, ModelCreator<T> creator, Map<String, String> headers);

  Future<T> post<T, U extends BaseModel>(
      String url, U body, ModelCreator<T> creator, Map<String, String> headers);

  Future<T> put<T, U extends BaseModel>(
      String url, U body, ModelCreator<T> creator, Map<String, String> headers);

  Future delete(String url, Map<String, String> headers);
}

class HttpAdapter implements IHttpAdapter {
  static late ConnectivityHelper _connectivityHelper;

  @override
  Future<T> get<T>(
      String url, ModelCreator<T> creator, Map<String, String> headers) async {
    try {
      _checkForConnection();
      final response = await http.get(url.getFulPath(), headers: headers);
      final result = response.getResponse<T>(response, creator);
      return result;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  @override
  Future<T> post<T, U extends BaseModel>(String url, U body,
      ModelCreator<T> creator, Map<String, String> headers) async {
    try {
      _checkForConnection();
      final response = await http.post(url.getFulPath(),
          headers: headers, body: body.toJson());
      final result = response.getResponse<T>(response, creator);
      return result;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  @override
  Future<T> put<T, U extends BaseModel>(String url, U body,
      ModelCreator<T> creator, Map<String, String> headers) async {
    try {
      _checkForConnection();
      final response = await http.put(url.getFulPath(),
          headers: headers, body: body.toJson());
      final result = response.getResponse<T>(response, creator);
      return result;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  @override
  Future delete(String url, Map<String, String> headers) async {
    try {
      _checkForConnection();
      await http.delete(url.getFulPath(), headers: headers);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  _checkForConnection() {
    if (!_connectivityHelper.isValidConnection()) {
      throw ConnectivityException("Not connected to internet");
    }
  }
}

extension ApiHeadersExtensions on Map<String, String>? {
  static const String connection = "Connection";
  static const String userAgent = "User-Agent";
  static const String authorization = "Authorization";

  Future<Map<String, String>> addCommonHeaders(bool authRequired) async {
    var headers = this ?? <String, String>{};

    if (!headers.containsKey(connection)) headers[connection] = 'keep-alive';
    if (!headers.containsKey(userAgent)) headers[userAgent] = 'flutter';

    // if (!headers.containsKey(authorization) && isAuthRequired) {
    //   headers[authorization] =  TokenProvider(cache: null)._getToken();
    // }

    return headers;
  }
}

extension ApiUrlExtensions on String {
  static final String _apiBaseUrl =
      dotenv.get('apiBaseUrl', fallback: 'http://localhost:4200');

  Uri getFulPath() {
    var url = Uri.parse(_apiBaseUrl + this);
    return url;
  }
}

extension ResponseExtensions on http.Response {
  T getResponse<T>(http.Response response, ModelCreator<T> creator) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(utf8.decode(response.bodyBytes));
        var result = creator(responseJson);
        return result;
      case 400:
        var responseJson = json.decode(response.body.toString());
        throw BadRequestException(responseJson["message"]);
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

class ApiException implements Exception {
  final String errorCode;
  final String prefix;
  final String message;

  ApiException(this.errorCode, this.prefix, this.message);

  @override
  String toString() {
    return "$errorCode::$prefix:$message";
  }
}

class FetchDataException extends ApiException {
  FetchDataException([String? message])
      : super("E500", "Error During Communication", message ?? "");
}

class BadRequestException extends ApiException {
  BadRequestException([message])
      : super("E400", "Invalid Request", message ?? "");
}

class UnauthorisedException extends ApiException {
  UnauthorisedException([message])
      : super("E401", "Unauthorised", message ?? "");
}

class InvalidInputException extends ApiException {
  InvalidInputException([String? message])
      : super("E400", "Invalid Input", message ?? "");
}

class ConnectivityException extends ApiException {
  ConnectivityException([String? message])
      : super("E001", "Connection is not active", message ?? "");
}
