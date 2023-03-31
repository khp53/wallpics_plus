import 'package:url_launcher/url_launcher.dart';
import 'package:wallpics_plus/screens/viewmodel.dart';

class WallpaperDetailsViewmodel extends Viewmodel {

  Future<void> openUrl(String uri) async {
    final Uri url = Uri.parse(uri);
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}