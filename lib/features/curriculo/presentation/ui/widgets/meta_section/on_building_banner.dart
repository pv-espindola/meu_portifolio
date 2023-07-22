import 'package:flutter/material.dart';

class OnBuildingBanner extends StatelessWidget {
  const OnBuildingBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Text(
              'Area Meta-Linguagem',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Image.asset(
            'assets/images/on-building.png',
            scale: 1.7,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Text(
              'Estamos trabalhando nisso.',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          )
        ],
      ),
    );
  }
}
