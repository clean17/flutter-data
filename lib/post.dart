class Post {
  int postId;
  int id;
  String title;
  String body;

  Post({
    required this.postId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) { // factory는 메모리에 있으면 새로 만들지 않음
    return Post(
      postId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': postId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}