import 'package:flutter/material.dart';
import 'package:meu_portifolio/config/app_config.dart';
import 'package:meu_portifolio/features/meta/data/post_type_factory.dart';
import 'package:meu_portifolio/features/meta/presentation/providers/meta_provider.dart';
import 'package:provider/provider.dart';

import '../../../../data/enums.dart';




class SelectorPostType extends StatefulWidget {
  const SelectorPostType({Key? key}) : super(key: key);

  @override
  State<SelectorPostType> createState() => _SelectorPostTypeState();
}

class _SelectorPostTypeState extends State<SelectorPostType> {
  PostType type = PostType.note;


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),

      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: PostType.values
            .map((e) => Flexible(
                  child: FittedBox(
                    child: PostTypeRadioButton(
                        value: e,
                        groupValue: type,
                        onChanged: onChanged),
                  )

                ))
            .toList(),
      ),
    );
    
    SizedBox(
      width: 200,
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: PostType.values.length,
          itemBuilder: (context, index) {
            return RadioListTile<PostType>.adaptive(
                title: Text(PostType.values.elementAt(index).name),
                value: PostType.values.elementAt(index),
                groupValue: type,
                onChanged: onChanged);
          }),
    );




  }

  void onChanged(PostType? value) {
    if (value != null) {
      setState(() {
        type = value;
        context.read<MetaProvider>().setPostType(value);
      });
    }
  }
}


class PostTypeRadioButton extends StatelessWidget {
  final PostType value;
  final PostType groupValue;
  final Function(PostType? value) onChanged;


  const PostTypeRadioButton({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String postName = PostTypeFactory.getPostName(context, value);
    return Container(
      child: Column(
        children: [
          Radio(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged),
          FittedBox(child: Text(postName.capitalize()))
        ],
      ),
    );
  }
}

