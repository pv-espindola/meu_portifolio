import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meu_portifolio/features/meta/data/models/post_model.dart';

import '../../data/enums.dart';

class MetaPostFirestore {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('meta-post');

  Future<List<PostModel>> getPosts(PostType type) async {
    List<PostModel> posts = [];
    await collection.where(jsonType, isEqualTo: type.name).get().then((query) {
      for (var doc in query.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        PostModel post = PostModel.fromMap(data);
        posts.add(post);
      }
    });

    for(var post in posts){
      print('Post creator => ${post.name},\n Post id => ${post.id}, ');
    }

    posts.sort((a,b) => b.creationDate.compareTo(a.creationDate));

    return posts;
  }

  void savePost(PostModel postModel) async {
    postModel.creationDate = DateTime.now();
    await collection.add(postModel.toMap()).then((value) {
      value.update({'id': value.id});
    });
  }
}
