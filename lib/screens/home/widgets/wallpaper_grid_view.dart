import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:wallpics_plus/screens/home/home_viewmodel.dart';
import 'package:wallpics_plus/screens/wallpaper_details/wallpaper_details_view.dart';

import '../../../models/wallpapers.dart';

class WallPaperGridView extends StatefulWidget {
  final Tab tab;
  final HomeViewmodel viewmodel;

  const WallPaperGridView(
      {Key? key, required this.tab, required this.viewmodel})
      : super(key: key);

  @override
  State<WallPaperGridView> createState() => _WallPaperGridViewState();
}

class _WallPaperGridViewState extends State<WallPaperGridView> {
  List<Wallpaper> wallpapers = [];

  @override
  void initState() {
    super.initState();
    widget.viewmodel
        .getWallPaperList(widget.tab.text!.toLowerCase())
        .then((val) {
      setState(() {
        wallpapers = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return wallpapers.isNotEmpty
        ? Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: MasonryGridView.count(
              itemCount: wallpapers.length,
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 10,
              itemBuilder: (context, index) {
                Wallpaper item = wallpapers[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WallpaperDetailsView(
                          wallpaper: item,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: (index % 3 + 2) * 100,
                    decoration: BoxDecoration(
                      color: Color(
                        int.parse(
                          item.avgColor!.replaceAll('#', '0xff'),
                        ),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Hero(
                        tag: '${item.id}',
                        child: Image(
                          image: NetworkImage(
                            item.src!.portrait!,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
