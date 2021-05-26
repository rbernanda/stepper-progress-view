import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final List<Widget> children;
  const Body({
    Key key,
    @required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children,
          )),
    );
  }
}
