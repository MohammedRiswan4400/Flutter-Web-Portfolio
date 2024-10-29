import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/view/widgets/bullet_points.dart';

class BulletList extends StatefulWidget {
  const BulletList({
    super.key,
    required this.contents,
  });

  final List<String> contents;

  @override
  State<BulletList> createState() => _BulletListState();
}

class _BulletListState extends State<BulletList>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animationController!.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: List.generate(widget.contents.length * 2, (index) {
          if (index.isEven) {
            return Flexible(
              child: BulletPoints(
                text: widget.contents[index ~/ 2],
                animationController: animationController!,
              ),
              flex: 2,
            );
          } else {
            return Spacer(
              flex: 2,
            );
          }
        }),
      ),
    );
  }
}
