import 'package:wallpics_plus/dependency/dependencies.dart';
import 'package:wallpics_plus/models/wallpapers.dart';
import 'package:wallpics_plus/screens/viewmodel.dart';
import 'package:wallpics_plus/services/home_services/home_services.dart';

class HomeViewmodel extends Viewmodel {
  HomeService get hService => dependency();

  List<Wallpaper> wallpapers = [];

  getWallPaperList(String category) async {
    var result = await hService.getWallpaperData(category);
    wallpapers = result.map((e) => Wallpaper.fromJson(e)).cast<Wallpaper>().toList();
    return wallpapers;
  }
}
