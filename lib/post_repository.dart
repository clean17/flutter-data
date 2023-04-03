import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PostRepository {
  final dio = Dio();

  Future<void> findById(int id) async {
    Response responseFT = await dio.get("https://jsonplaceholder.typicode.com/posts/$id");
    Map<String, dynamic> responseMap = responseFT.data;
    print(responseMap["userId"]);
  }

  // void findById2(int id) {
  //   Future<Response> responseFT = dio.get("https://jsonplaceholder.typicode.com/posts/$id");
  //   print(responseFT);
  // }  // 이거 대체 뭔데 .. 나중에 알아봐야 할듯 이거는 못가져오는거 ?

  Future<void> findAll() async {
    Response responseFT = await dio.get("https://jsonplaceholder.typicode.com/posts");
    print(responseFT.data);
  }
}