import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CostumeTabBarView extends StatelessWidget {
  const CostumeTabBarView(
      {super.key, required this.tabController, required this.tabs});
  final TabController tabController;
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    double tabBarScaling = kWidth > 1400
        ? 0.21
        : kWidth > 1100
            ? 0.3
            : 0.4;
    return Padding(
      padding: EdgeInsets.only(right: kWidth * 0.05),
      child: Container(
        width: kWidth * tabBarScaling,
        child: Theme(
          data: ThemeData(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent),
          child: TabBar(
            tabs: tabs,
            controller: tabController,
            dividerColor: Colors.black,
            indicatorColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
