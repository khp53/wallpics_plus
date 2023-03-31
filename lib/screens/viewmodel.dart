//-------------------------------------
// Don't change this file
//-------------------------------------

import 'package:flutter/foundation.dart';

class Viewmodel with ChangeNotifier {
  bool _busy = false;
  get busy => _busy;

  void turnBusy() {
    _busy = true;
  }

  void turnIdle() {
    _busy = false;
    notifyListeners();
  }

  void update(AsyncCallback fn) async {
    turnBusy();
    await fn();
    turnIdle();
  }
}