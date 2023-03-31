import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpics_plus/screens/home/home_viewmodel.dart';
import 'package:wallpics_plus/screens/home/widgets/wallpaper_grid_view.dart';

class HomeBody extends StatelessWidget {
  final HomeViewmodel viewmodel;

  const HomeBody({Key? key, required this.viewmodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: theme.colorScheme.background,
          centerTitle: true,
          title: const Image(
            image: AssetImage("assets/images/logo.png"),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              child: TabBar(
                indicatorWeight: 0,
                isScrollable: true,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                labelColor: theme.colorScheme.background,
                unselectedLabelColor: Colors.white,
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                indicator: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                physics: const BouncingScrollPhysics(),
                tabs: categories,
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: categories
              .map(
                (tab) => WallPaperGridView(
                  tab: tab,
                  viewmodel: viewmodel,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  final List<Tab> categories = const [
    Tab(text: "DISCOVER"),
    Tab(text: "NATURE"),
    Tab(text: "TECH"),
    Tab(text: "ART"),
    Tab(text: "CITY"),
    Tab(text: "ABSTRACT"),
  ];
}
