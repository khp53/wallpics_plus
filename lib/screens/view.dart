//----------------------------------
// Default View is with Selector and ChangeNotifierProvier
// Don't do anything with this file
//-----------------------------------

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpics_plus/screens/viewmodel.dart';

class View extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    Viewmodel viewmodel,
    Widget? child,
  ) _builder;
  final Viewmodel _viewmodel;

  const View({
    super.key,
    required builder,
    required viewmodel,
  })  : _builder = builder,
        _viewmodel = viewmodel;

  Widget _baseBuilder(
      BuildContext context, Viewmodel viewmodel, Widget? child) {
    if (viewmodel.busy) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return _builder(context, viewmodel, child);
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
        value: _viewmodel,
        child: Consumer<Viewmodel>(
          builder: _baseBuilder,
        ),
      );
}
