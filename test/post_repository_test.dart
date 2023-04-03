import 'package:flutter/material.dart';
import '../../data_app/lib/post_repository.dart';

// void main() async {
//    // await PostRepository()..findById(1);
//   PostRepository postRepository = PostRepository();
//   await postRepository.findById(1); // await 로 기다리려면 Future로 리턴해야함..
// }

void main() async {
  await findById_test();
  // await findAll_test();
  // findById_test2();
}

Future<void> findById_test() async{
  int id = 1;

  PostRepository postRepository = PostRepository();
  await postRepository.findById(id);
  // await PostRepository()..findById(id);
}

// void findById_test2() {
//   int id = 1;
//
//   PostRepository postRepository = PostRepository();
//   postRepository.findById2(id);
// }

Future<void> findAll_test() async{
  PostRepository postRepository = PostRepository();
  await postRepository.findAll();
}