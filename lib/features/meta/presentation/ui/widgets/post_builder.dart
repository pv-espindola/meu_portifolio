import 'package:flutter/material.dart';
import 'package:meu_portifolio/config/app_config.dart';
import 'package:meu_portifolio/features/meta/data/post_type_factory.dart';
import 'package:meu_portifolio/features/meta/presentation/ui/widgets/empty_sign.dart';
import 'package:provider/provider.dart';

import '../../../data/enums.dart';
import '../../../data/models/post_model.dart';
import '../../providers/meta_provider.dart';

class PostBuilder extends StatelessWidget {
  final PostType postType;

  const PostBuilder({required this.postType, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
    final formProvider = context.watch<MetaProvider>();
    List<PostModel> posts = formProvider.getPostContent(postType);
    bool isEmpty = posts.isEmpty;
    return Container(
      padding: const EdgeInsets.all(16),
      constraints: BoxConstraints(
        minHeight: 80,
        maxHeight: 400,
        minWidth: 300,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: isEmpty ?
      const EmptySign()
      : RawScrollbar(

        thumbColor: Colors.white,
        thumbVisibility: true,
        trackVisibility: true,
        interactive: true,
        controller: controller,
        child: ListView.builder(
            shrinkWrap: true,
            controller: controller,
            itemCount: posts.length,
            padding: const EdgeInsets.only(right: 16),
            itemBuilder: (context, index) {
              final post = posts.elementAt(index);
              return PostItem(post: post);
            }),
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  final PostModel post;

  const PostItem({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border.all(
            width: 3, color: Colors.black
        ),
        borderRadius: BorderRadius.circular(8),

      ),
      child: ListTile(

        contentPadding: EdgeInsets.zero,
          minVerticalPadding: 0,
        shape: const RoundedRectangleBorder(),
        title: Container(

            decoration: BoxDecoration(
              color: PostTypeFactory.getPostColor(post.type),

            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16),
                  child: Text(
                    post.name,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  flex: 6,
                  
                  child: Text(
                    '- ${post.role}',
                    maxLines: 5,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.only(right: 4),

                    child: Text(
                      post.creationDate.formattedWithHours(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 8, color: Colors.white),
                    ),
                  ),
                ),
              ],
            )),
        subtitle: Container(
          padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
                color: Colors.white,

            ),
            child: Text(
              ' - ${post.message}',
              style: const TextStyle(fontSize: 14, color: Colors.black),
            )),
      ),
    );


  }


}
