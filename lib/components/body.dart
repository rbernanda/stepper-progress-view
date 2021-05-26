import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final List<Widget> children;
  final double height;
  const Body({
    Key key,
    this.height,
    @required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
          height: this.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children,
          )),
    );
  }
}
