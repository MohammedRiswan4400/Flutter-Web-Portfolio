import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/view/widgets/app_widgets.dart';
import 'package:flutter_portfolio_web/view/widgets/content_view.dart';
import 'package:flutter_portfolio_web/view/widgets/custome_tab_bar_view.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome>
    with SingleTickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  TabController? tabController;

  List<ContentView> contentview = [
    ContentView(
      tab: const CustomeTab(
        title: 'Home',
      ),
      content: Container(
        color: Colors.amberAccent,
        height: 80,
        width: 80,
      ),
    ),
    ContentView(
      tab: const CustomeTab(title: 'About'),
      content: Container(
        color: const Color.fromARGB(255, 7, 255, 98),
        height: 80,
        width: 80,
      ),
    ),
    ContentView(
      tab: const CustomeTab(title: 'Projects'),
      content: Container(
        color: const Color.fromARGB(255, 255, 7, 143),
        height: 80,
        width: 80,
      ),
    ),
  ];
  @override
  void initState() {
    tabController = TabController(length: contentview.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final kHeight = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
    final topPadding = kHeight * 0.05;
    final bottomPadding = kHeight * 0.01;
    return Scaffold(
      endDrawer: drawer(),
      key: scaffoldKey,
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding, top: topPadding),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 715) {
              return DesktopView(
                controller: tabController!,
                tabs: contentview.map((e) => e.tab).toList(),
                screenHeight: kHeight,
                children: contentview.map((e) => e.content).toList(),
              );
            } else {
              return mobilePhoneView();
              // MobilePhoneView(
              //   screenWidth: kWidth,
              //   childrenTabs: contentview.map((e) => e.tab).toList(),
              // );
            }
          },
        ),
      ),
    );
  }

  Widget mobilePhoneView() {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding:
          EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                log('message');
                scaffoldKey.currentState?.openEndDrawer();
              },
              icon: const Icon(Icons.menu_open_rounded),
              color: Colors.white,
            ),
            // DrawerWidget(children: childrenTabs)
          ],
        ),
      ),
    );
  }

  Widget drawer() {
    return Drawer(
      width: MediaQuery.of(context).size.width / 2.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: contentview
              .map((e) => Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black),
                      child: ListTile(
                        title: Text(
                          e.tab.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class MobilePhoneView extends StatelessWidget {
  const MobilePhoneView({
    super.key,
    required this.screenWidth,
    required this.childrenTabs,
  });
  final double screenWidth;
  final List<Widget> childrenTabs;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu_open_rounded),
            color: Colors.white,
          ),
          // DrawerWidget(children: childrenTabs)
        ],
      ),
    );
  }
}

class DesktopView extends StatelessWidget {
  const DesktopView({
    super.key,
    required this.controller,
    required this.tabs,
    required this.children,
    required this.screenHeight,
  });
  final TabController controller;
  final List<Widget> tabs;
  final List<Widget> children;
  final double screenHeight;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CostumeTabBarView(tabController: controller, tabs: tabs),
        Container(
          color: Colors.amberAccent,
          height: screenHeight * 0.85,
          child: TabBarView(controller: controller, children: children),
        ),
      ],
    );
  }
}

// class DrawerWidget extends StatelessWidget {
//   const DrawerWidget({super.key, required this.children});
//   final List<Widget> children;
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: childrenTabs,
//       ),
//     );
//   }
// }
