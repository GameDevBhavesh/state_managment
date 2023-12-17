import 'package:flutter/widgets.dart';

abstract class BaseController extends ChangeNotifier {}

class ControllerQuery<T extends BaseController> extends InheritedWidget {
  const ControllerQuery(
      {super.key, required this.controller, required super.child});
  final T controller;
  static J? of<J extends BaseController>(BuildContext context) {
    final iwidget =
        context.dependOnInheritedWidgetOfExactType<ControllerQuery<J>>();
    if (iwidget != null) {
      return context
          .dependOnInheritedWidgetOfExactType<ControllerQuery<J>>()!
          .controller;
    }
    return null;
  }

  @override
  bool updateShouldNotify(covariant ControllerQuery<T> oldWidget) {
    return false;
  }
}

class Inject<T extends BaseController> extends InheritedWidget {
  const Inject({super.key, required this.controller, required super.child});
  final T controller;
  static J? of<J extends BaseController>(BuildContext context) {
    final iwidget = context.dependOnInheritedWidgetOfExactType<Inject<J>>();
    if (iwidget != null) {
      return context
          .dependOnInheritedWidgetOfExactType<Inject<J>>()!
          .controller;
    }
    return null;
  }

  @override
  bool updateShouldNotify(covariant ControllerQuery<T> oldWidget) {
    return false;
  }
}
