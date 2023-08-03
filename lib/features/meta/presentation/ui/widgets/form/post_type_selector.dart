import 'package:flutter/material.dart';
import 'package:meu_portifolio/config/app_config.dart';

import '../../../../data/enums.dart';



class PostTypeSelector extends StatefulWidget {
  const PostTypeSelector({Key? key}) : super(key: key);

  @override
  State<PostTypeSelector> createState() => _PostTypeSelectorState();
}

class _PostTypeSelectorState extends State<PostTypeSelector> {
  PostType type = PostType.note;

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: PostType.values
            .map((e) => Flexible(
                  child: PostTypeRadioButtom(
                      text: e.name,
                      value: e,
                      groupValue: type,
                      onChanged: onChanged)

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
      });
    }
  }
}


class PostTypeRadioButtom extends StatelessWidget {
  final String text;
  final PostType value;
  final PostType groupValue;
  final Function(PostType? value) onChanged;


  const PostTypeRadioButtom({
    required this.text,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Radio(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged),
          FittedBox(child: Text(text.capitalize()))
        ],
      ),
    );
  }
}

