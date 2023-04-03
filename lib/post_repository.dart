import 'package:data_app/post.dart';
import 'package:dio/dio.dart';

class PostRepository {
  final dio = Dio();

  Future<Post> findById(int id) async {
    Response responseFT = await dio.get("https://jsonplaceholder.typicode.com/posts/$id");
    Map<String, dynamic> responseMap = responseFT.data;
    print(responseMap["userId"]);
    Post post = Post.fromJson(responseFT.data); // Map으로 매핑된 데이터를 유저 오브젝트로 변환
    return post;
  }

  Future<Post> findById2(int id) async {
    Response responseFT = await dio.get("https://jsonplaceholder.typicode.com/posts/$id");
    Map<String, dynamic> responseMap = responseFT.data;
    print(responseMap["userId"]);
    Post post = Post.fromJson(responseFT.data); // Map으로 매핑된 데이터를 유저 오브젝트로 변환
    return post;
  }

  // void findById2(int id) {
  //   Future<Response> responseFT = dio.get("https://jsonplaceholder.typicode.com/posts/$id");
  //   print(responseFT);
  // }  // 이거 대체 뭔데 .. 나중에 알아봐야 할듯 이거는 못가져오는거 ?

  Future<void> findAll() async {
    Response responseFT = await dio.get("https://jsonplaceholder.typicode.com/posts");
    print(responseFT.data);
  }

  Future<List<Post>> findAll2() async {
    Response responseFT = await dio.get("https://jsonplaceholder.typicode.com/posts");
    List<dynamic> responseBody = responseFT.data;
    List<Post> postList = responseBody.map((e) => Post.fromJson(e)).toList();  // map을 오브젝트로 변환
    return postList;
  }

  Future<void> findAll3() async {
    Response responseFT = await dio.get("https://jsonplaceholder.typicode.com/posts");
    // List<Map<String, dynamic>> responseBody = responseFT.data;
    List<Post> postList = responseFT.data.map((e) => Post.fromJson(e))
        .toList();  // map을 오브젝트로 변환
  }
}