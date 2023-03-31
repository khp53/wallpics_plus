import 'package:get/get.dart';
import 'package:wallpics_plus/dependency/dependencies.dart';
import 'package:wallpics_plus/models/wallpapers.dart';
import 'package:wallpics_plus/services/home_services/home_services.dart';
import 'package:wallpics_plus/services/rest_service.dart';

class HomeServicesRest implements HomeService {
  RestService get rest => dependency();
  
  @override
  getWallpaperData(String category) async{
    final Map<String, dynamic> map =
        await rest.get("search?query=$category&per_page=20");
    //Get.log(map['photos'].toString());
    return map['photos'];
  }

}