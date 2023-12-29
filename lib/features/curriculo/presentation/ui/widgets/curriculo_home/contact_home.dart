import 'package:flutter/material.dart';
import 'package:meu_portifolio/config/app_clibboard.dart';
import 'package:meu_portifolio/config/app_icons.dart';
import 'package:meu_portifolio/config/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:meu_portifolio/config/app_url_launcher.dart';
import 'package:meu_portifolio/features/curriculo/data/model/contact_model.dart';
import 'package:seo_renderer/renderers/link_renderer/link_renderer_vm.dart';




class ContactHome extends StatelessWidget {
  const ContactHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String contactTitle = AppLocalizations.of(context)!.contactTitle;
    Color boxColor = Colors.transparent;

    showSnackBar(String gesture) {
      var snackBar =  SnackBar(
        content: Text('You $gesture'),
      );

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return Container(
      padding: const EdgeInsets.all(8),
      child:  Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Container(
            margin: const EdgeInsets.only(left: 16,),
              child: Text(contactTitle.toUpperCase(),
              style: Theme.of(context).textTheme.topicTitle,
              )),

          LinkableItem(model: ContactModel.git(),),
          LinkableItem(model: ContactModel.linkedin(),),
          LinkableItem(model: ContactModel.phone(),),
          LinkableItem(model: ContactModel.email(),),




          // const ContactItem(icon: Icons.phone,
          // name: '+55(31)9 9303-3936',
          // ),
          // const ContactItem(icon: Icons.mail,
          // name: 'pvespindola.developer@gmail.com',
          // ),
          const ContactItem(icon: Icons.home_filled,
          name: 'Belo Horizonte-MG',
          ),


        ],
      ),
    );


  }


}

class LinkableItem extends StatelessWidget{
  ContactModel model;
  Color boxColor = Colors.transparent;


  LinkableItem({required this.model, super.key});

  void _showSnackBar(BuildContext context){
    final String message = AppLocalizations.of(context)!.copied;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final void Function() action =
        model.type == ContactType.phone ||
            model.type == ContactType.email ?
        () {
          model.action();
          _showSnackBar(context);

        }
            : model.action;


    return LinkRenderer(
      text: model.text,
      href: model.text,
      child: Material(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: InkWell(
            splashColor : Colors.grey,
            splashFactory : InkSplash.splashFactory,
            onTap: action,
            onHover: (value){boxColor = value? Colors.purpleAccent[200]! : Colors.transparent;},
            child: Container(
              padding: const EdgeInsets.fromLTRB(4, 8, 8, 8),
              margin: const EdgeInsets.only(bottom: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: boxColor,

              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    model.icon,
                    size: 24,
                    color: Colors.black,),
                  const SizedBox(width: 8,),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      model.text,
                      style: Theme.of(context).textTheme.likableStyle,
                    ),
                  )
                ],
              ),
            ),
          )),
    );

  }
}

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String name;
  const ContactItem({
    required this.icon,
    required this.name,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(width: 8,),
          Flexible(child: Text(name,
          style: Theme.of(context).textTheme.curriculoStyle,
          ))
        ],
      ),
    );
  }
}

