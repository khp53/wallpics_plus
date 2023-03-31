import 'package:flutter/material.dart';

import '../../models/wallpapers.dart';

class WallpaperFullView extends StatelessWidget {
  final Wallpaper wallpaper;

  const WallpaperFullView({Key? key, required this.wallpaper}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4), shape: BoxShape.circle),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Center(
        child: Image(
          image: NetworkImage(
            wallpaper.src!.large2x!,
          ),
        ),
      ),
    );
  }
}
