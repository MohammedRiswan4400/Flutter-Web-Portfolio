import 'package:flutter/material.dart';

class TabControllerHandler extends InheritedWidget {
  final TabController tabController;

  const TabControllerHandler({
    super.key,
    // required Key key,
    required this.tabController,
    required Widget child,
  }) : super(child: child);

  static TabControllerHandler? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TabControllerHandler>();
  }

  @override
  bool updateShouldNotify(TabControllerHandler oldWidgets) {
    return oldWidgets.tabController != tabController;
  }
}
