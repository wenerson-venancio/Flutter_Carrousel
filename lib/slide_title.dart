import 'package:flutter/material.dart';

class SlideTitle extends StatelessWidget {
  final image;
  final bool activePage;

  const SlideTitle({super.key, required this.image, required this.activePage});

  @override
  Widget build(BuildContext context) {


    double top = activePage ? 10 : 100;

    return AnimatedContainer(
        duration: const Duration(microseconds: 10),
        margin: EdgeInsets.only(top: top, bottom: 400, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          // boxShadow: const [
          //   BoxShadow(
          //       color: Colors.black45, blurRadius: 10, offset: Offset(3, 16))
          // ]),
        ));
  }
}
