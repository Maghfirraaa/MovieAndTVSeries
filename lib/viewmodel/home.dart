import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/film.dart';

class Service {
  static Future<List<Data>> getDataHome() async {
    Dio dio = Dio();
    var response = await dio.get('http://10.0.2.2:3000/data');

    print('status code : ${response.statusCode}');
    var dataResponse = response.data;
    //print(dataResponse);

    List<Data> datas =
        (response.data as List).map((e) => Data.fromJson(e)).toList();
    return datas;
  }
}
