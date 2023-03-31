import 'package:flutter/material.dart';
import 'package:wallpics_plus/screens/wallpaper_details/wallpaper_details_viewmodel.dart';
import 'package:wallpics_plus/screens/wallpaper_details/widgets/wallpaper_details_body.dart';

import '../../../models/wallpapers.dart';
import '../view.dart';

class WallpaperDetailsView extends StatelessWidget {
  final Wallpaper wallpaper;
  const WallpaperDetailsView({Key? key, required this.wallpaper}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return View(builder: (context, viewmodel, _){
      return WallpaperDetailsBody(
          viewmodel: viewmodel,
          wallpaper: wallpaper
      );
    }, viewmodel: WallpaperDetailsViewmodel(),
    );
  }
}