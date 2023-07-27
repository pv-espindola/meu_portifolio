import 'package:flutter/material.dart';
import 'package:meu_portifolio/config/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';




class ContactHome extends StatelessWidget {
  const ContactHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String contactTitle = AppLocalizations.of(context)!.contactTitle;

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
          ContactItem(icon: Icons.person,
          name: 'Paulo Victor Espindola',
          ),
          ContactItem(icon: Icons.phone,
          name: '(31) 99303-3936',
          ),
          ContactItem(icon: Icons.mail,
          name: 'pvespindola.developer@gmail.com',
          ),
          ContactItem(icon: Icons.home_filled,
          name: 'Av. Fleming, 513. Belo Horizonte-MG',
          ),


        ],
      ),
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        Flexible(child: Text(name,))
      ],
    );
  }
}

