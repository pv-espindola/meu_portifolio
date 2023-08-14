import 'package:flutter/material.dart';

import '../widgets/curriculo_home/contact_home.dart';
import '../widgets/curriculo_home/education_home.dart';
import '../widgets/curriculo_home/general_attributions_home.dart';
import '../widgets/curriculo_home/introduction_home.dart';
import '../widgets/curriculo_home/projects_home.dart';
import '../widgets/curriculo_home/skills_home.dart';
import '../widgets/curriculo_home/summary_home.dart';

class HomeCurriculoSection extends StatelessWidget {
  const HomeCurriculoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool inLine = width < 1020;

    return Container(
      constraints: const BoxConstraints(
        maxWidth: 850,
        minWidth: 500,
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[400],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const IntroductionHome(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    width: 400,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ContactHome(),
                        const SummaryHome(),
                        if (inLine)
                          Container(
                            color: Colors.grey[400],
                            child: const ProjectsHome(),
                          )
                      ],
                    ),
                  ),
                ),
                if (!inLine)
                  const SizedBox(
                    width: 24,
                  ),
                if (!inLine) const Flexible(flex: 3, child: ProjectsHome())
              ],
            ),
            const EducationHome(),
            const SizedBox(
              height: 16,
            ),
            const SkillsHome(),
            const SizedBox(
              height: 16,
            ),
            const GeneralAttributionsHome()
          ],
        ),
      ),
    );
  }
}