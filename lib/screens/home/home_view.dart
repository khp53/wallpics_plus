import 'package:flutter/material.dart';
import 'package:wallpics_plus/screens/home/home_viewmodel.dart';
import 'package:wallpics_plus/screens/home/widgets/home_body.dart';
import 'package:wallpics_plus/screens/view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return View(
      builder: (context, viewmodel, _) {
        return HomeBody(
          viewmodel: viewmodel,
        );
      },
      viewmodel: HomeViewmodel(),
    );
  }
}
