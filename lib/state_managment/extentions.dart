import 'package:flutter/material.dart';

import 'controller_query.dart';

extension ControllerQueryEx on BuildContext {
  T? find<T extends BaseController>() {
    return ControllerQuery.of<T>(this);
  }

  T? findInjected<T extends BaseController>() {
    return Inject.of<T>(this);
  }

  Widget watch<T extends BaseController>(
      Widget Function(BuildContext, Widget?) change,
      {Widget? child}) {
    final dep = findInjected<T>();
    if (dep == null) {
      return Placeholder(
        child: Text(
            "Controller of type ${T.runtimeType} not found, please wrap top level widget with ControllerQuery InhertedWidget "),
      );
    }
    return ListenableBuilder(listenable: dep!, child: child, builder: change);
  }
}

extension BuildEx on ChangeNotifier {
  Widget build(Widget Function() build) {
    return ListenableBuilder(
        listenable: this,
        builder: (context, _) {
          return build();
        });
  }
}

// ignore: non_constant_identifier_names
Widget Observe(ChangeNotifier notifer, Widget Function() build) {
  return ListenableBuilder(
      listenable: notifer,
      builder: (context, _) {
        return build();
      });
}

// ignore: non_constant_identifier_names
Widget ObserveT<T extends BaseController>(
    BuildContext context, Widget Function(T? controler, Widget? c) build,
    {Widget? child}) {
  final dep = context.find<T>();
  return ListenableBuilder(
      listenable: dep!,
      child: child,
      builder: (context, _) {
        return build(dep, _);
      });
}
