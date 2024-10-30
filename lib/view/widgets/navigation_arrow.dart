import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/controller/tab_controller_handler.dart';

class WidgetNavigationArrow extends StatelessWidget {
  const WidgetNavigationArrow({super.key, required this.isBackArrow});
  final bool isBackArrow;
  @override
  Widget build(BuildContext context) {
    TabController tabController =
        TabControllerHandler.of(context)!.tabController;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: isBackArrow ? Alignment.centerLeft : Alignment.centerRight,
        child: IconButton(
          icon: Icon(isBackArrow
              ? Icons.arrow_back_ios
              : Icons.arrow_forward_ios_rounded),
          onPressed: () {
            tabController.animateTo(isBackArrow
                ? tabController.index - 1
                : tabController.index + 1);
          },
          color: Colors.white,
          splashColor: Colors.transparent,
        ),
      ),
    );
  }
}
