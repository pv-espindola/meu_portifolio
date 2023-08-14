import 'package:url_launcher/url_launcher.dart';

class AppUrlLauncher {
  AppUrlLauncher._();

  static final AppUrlLauncher instance = AppUrlLauncher._();


  final String myGit = 'github.com/pv-espindola';
  final String _git = 'https://github.com/pv-espindola';
  final String myLinkedin = 'linkedin.com/in/pvespindola/';
  final String _Linkedin = 'https://www.linkedin.com/in/pvespindola/';




  void openGit() async {
    final Uri url = Uri.parse(_git);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
  void openLinkedin() async {
    final Uri url = Uri.parse(_Linkedin);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

}