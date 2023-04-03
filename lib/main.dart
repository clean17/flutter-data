import 'package:data_app/post.dart';
import 'package:data_app/post_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final byeWorldProvider = Provider<String>((ref) => 'bye');
//
// final helloWorldProvider = Provider<String>((ref) {
//   final String value = ref.read(byeWorldProvider);
//   return 'Hello world: '+value;
// });

// StateNotifierProvider 제네릭의 첫번째인수로 클래스를 만들어야 한다.
 class Counter extends StateNotifier<int>{ // int를 관리하는 스토어
   // Counter() : super(0);
   Counter(int num) : super(num);

   void increment(){
     state++; // state는 제네릭의 타입이 된다.
     // super 의 파라미터 자리의 데이터를 바꿀 수 있음
     // 제네릭에 만든 클래스를 넣었다면 state.name 처럼 접근가능함
   }
 }

final counterProvider = StateNotifierProvider<Counter, int>((ref) {
  return Counter(0);
});

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int value = ref.watch(counterProvider);
    // ref.read를 하면 한번만 읽으므로 초기화면에서 바뀌지 않는다.

    return MaterialApp(
      home:
      HomePage2(),
      // Scaffold(
      //   appBar: AppBar(title: const Text('Example')),
      //   body: Center(
      //     child: Text(value.toString(), style: TextStyle(fontSize: 100),),
      //   ),
      //   floatingActionButton: FloatingActionButton(
      //     onPressed: (){
      //       ref.read(counterProvider.notifier).increment(); // notifier는 StateNotifier를 구현하는 객체
      //       // notifier는 변경 불가능한 일반적인 Provider와 달리 상태를 변경하는 Provider를 생성한다.
      //     },
      //     child: Icon(Icons.add),
      //   ),
      // ),
    );
  }
}



class HomePage2 extends StatelessWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("나도 실행");
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: PostRepository().findById(1),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print("데이터 있음");
                  Post post = snapshot.data!;
                  return Center(child: Text("${post.title}", style: TextStyle(
                    fontSize: 30,
                  ),));
                } else {
                  print("데이터 없음");
                  return CircularProgressIndicator();
                }
              },
            ),
          ),

          Expanded(
            child: FutureBuilder(
              future: PostRepository().findAll2(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Post> postList = snapshot.data!;
                  return ListView.separated(
                    itemCount: postList.length,
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.grey,
                        height: 1,
                        thickness: 1,
                      );
                    },
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.ac_unit_outlined),
                        title: Text("${postList[index].title}"),
                        subtitle: Text("${postList[index].body}"),
                      );
                    },
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}




