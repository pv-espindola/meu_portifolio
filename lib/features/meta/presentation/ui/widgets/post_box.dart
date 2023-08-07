import 'package:flutter/material.dart';
import 'package:meu_portifolio/config/app_config.dart';
import 'package:meu_portifolio/config/theme_extensions/gradient_extension.dart';
import 'package:meu_portifolio/features/meta/data/models/post_model.dart';
import 'package:meu_portifolio/features/meta/data/post_type_factory.dart';
import 'package:meu_portifolio/features/meta/presentation/providers/meta_provider.dart';
import 'package:meu_portifolio/features/meta/presentation/ui/widgets/meta_expansion_box.dart';
import 'package:provider/provider.dart';

import '../../../data/enums.dart';
import 'post_builder.dart';

class PostBox extends StatefulWidget {
  const PostBox({Key? key}) : super(key: key);

  @override
  State<PostBox> createState() => _PostBoxState();
}

class _PostBoxState extends State<PostBox> {
  late MetaProvider formProvider;

  @override
  void initState() {
    formProvider = context.read<MetaProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> postNames = List.castFrom(PostType.values)
        .map((e) => PostTypeFactory.getPostName(context, e))
        .toList();

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: PostType.values.length,
      itemBuilder: (BuildContext context, int index) {
        PostType type = PostType.values[index];
        Gradient gradient = Theme.of(context)
            .extension<GradientExtension>()!
            .getPostGradient(type);
        String postName = postNames[index];

        return MetaExpansionBox(
          title: '${postName.capitalize()}s',
          gradient: gradient,
          icon: PostTypeFactory.getPostIcon(type),
          child: PostBuilder(
            postType: type,
          ),
        );
      },
    );
  }
}

class PostName extends StatelessWidget {
  const PostName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
