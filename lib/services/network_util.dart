import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:moniepoint_task/helper/Helper.dart';
import 'package:moniepoint_task/helper/app_prefs.dart';
import 'package:moniepoint_task/helper/config.dart';
import 'package:moniepoint_task/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'base_service.dart';

class NetworkUtil implements BaseServices {
  Map<String, String> headers = {
    'Accept': '*/*',
    'Accept-Encoding': 'gzip, deflate, br',
    // 'Content-Type': 'multipart/form-data',
    // "Host": 'www.moniepoint_tasklives.com',
    // "Accept": "application/json",
    // "Content-Type": "application/x-www-form-urlencoded",
    // "Connection": "keep-alive",
    'Authorization': 'Bearer efac476d57709aadcc2addc6',
  };

  http.Client client = http.Client();

  Future<Response> _get(
    String url,
    Map<String, String>? headers,
  ) async {
    if (locator<AppPrefs>().token.getValue().isNotEmpty) {
      headers!['Authorization'] =
          'Bearer ${locator<AppPrefs>().token.getValue()}';
    }

    log('GET-URL:: $url');
    log('GET-HEADER:: $headers');

    // final dio = d.Dio();
    // final response = await dio.request(url,
    //     options: d.Options(
    //       headers: {
    //         'Authorisation': 'Bearer ${locator<AppPrefs>().token.getValue()}',
    //         'Accept': '*/*',
    //         'Accept-Encoding': 'gzip, deflate, br',
    //         'Content-Type': 'multipart/form-data',
    //       },
    //       // responseType: d.ResponseType.json,
    //       contentType: d.Headers.formUrlEncodedContentType,
    //       method: 'GET',
    //     ));
    // log('dio resp -> ${response.data}');
    return await client
        .get(
      Uri.parse(url),
      headers: headers,
    )
        .then((Response response) {
      return _handleResponse(response, url);
    });
//     var request = http.MultipartRequest('GET', Uri.parse(url));
//
// //add header fields from requestHeader map
//     request.headers.addAll(headers!);
//     final streamResponse = await request.send();
//     return _handleResponse(await Response.fromStream(streamResponse), url);
  }

  Future<Response> _post(String url,
      {Map<String, String>? headers, body, encoding}) async {
    if (locator<AppPrefs>().token.getValue().isNotEmpty) {
      headers!['Authorization'] =
          'Bearer ${locator<AppPrefs>().token.getValue()}';
    }
    // else {
    //   headers!.remove('Authorization');
    // }
    log('POST-URL:: $url \n BODY: $body \n headers: $headers');
    return await http
        .post(Uri.parse(url), body: body, headers: headers, encoding: encoding)
        .then((Response response) {
      return _handleResponse(response, url);
    });
  }

  Future<Response> _delete(String url, {Map<String, String>? headers}) {
    log('DELETE-URL:: $url  \n Header: $headers');
    if (headers!.containsKey('Authorization')) {
      headers['Authorization'] =
          'Bearer ${locator<AppPrefs>().token.getValue()}';
    }
    return http
        .delete(
      Uri.parse(url),
      headers: headers,
    )
        .then((Response response) {
      return _handleResponse(response, url);
    });
  }

  Future<Response> _put(String url,
      {Map<String, String>? headers, body, encoding}) async {
    log('PUT-URL:: $url  \n BODY: $body');
    if (headers!.containsKey('Authorization')) {
      headers['Authorization'] =
          'Bearer ${locator<AppPrefs>().token.getValue()}';
    }
    return await http
        .put(Uri.parse(url), body: body, headers: headers, encoding: encoding)
        .then((Response response) {
      return _handleResponse(response, url);
    });
  }

  Future<Response> _patch(String url,
      {Map<String, String>? headers, body, encoding}) async {
    log('PATCH-URL:: $url  \n BODY: $body');
    if (headers!.containsKey('Authorization')) {
      headers['Authorization'] =
          'Bearer ${locator<AppPrefs>().token.getValue()}';
    }
    return await http
        .patch(Uri.parse(url), body: body, headers: headers, encoding: encoding)
        .then((Response response) {
      return _handleResponse(response, url);
    });
  }


  Response _handleResponse(Response response, String? url) {
    log('Response ($url):: ${response.body}');
    return response;
  }

  @override
  Future<Response> register({required Map<String, dynamic> body}) async {
    final Response response = await _post(
      AuthApiUrls.register,
      headers: headers,
      body: body,
    );

    return Future.value(response);
  }

  @override
  Future<Response> loginWithMobile({required Map<String, dynamic> body}) async {
    final Response response = await _post(
      AuthApiUrls.loginWithMobile,
      headers: headers,
      body: body,
    );

    return Future.value(response);
  }

  @override
  Future<Response> verifyOtp({required Map<String, dynamic> body}) async {
    final Response response = await _post(
      AuthApiUrls.verifyOtp,
      headers: headers,
      body: body,
    );
    return Future.value(response);
  }

  @override
  Future<Response> loginWithEmail({required Map<String, dynamic> body}) async {
    final Response response = await _post(
      AuthApiUrls.loginWithEmail,
      headers: headers,
      body: body,
    );
    return Future.value(response);
  }
}
