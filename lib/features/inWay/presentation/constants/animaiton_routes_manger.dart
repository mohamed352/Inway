import 'package:flutter/cupertino.dart';

class SlideRight extends PageRouteBuilder {
  final Widget page;
  SlideRight({required this.page})
      : super(
          pageBuilder: (context, anaimation, anaimation2) => page,
          transitionsBuilder: (context, anaimation, anaimation2, child) {
            var begin = const Offset(1, 0);
            var end = const Offset(0, 0);
            var tween = Tween(begin: begin, end: end);
            var carve = CurvedAnimation(
                parent: anaimation, curve: Curves.linearToEaseOut);
            return SlideTransition(
              position: tween.animate(carve),
              child: child,
            );
          },
        );
}

class SlideLeft extends PageRouteBuilder {
  final Widget page;
  SlideLeft({required this.page})
      : super(
            pageBuilder: (context, animation1, animation2) => page,
            transitionsBuilder: (context, animation1, animation2, child) {
              var begin = const Offset(-1, 0);
              var end = const Offset(0, 0);
              var tween = Tween(begin: begin, end: end);
              var curved = CurvedAnimation(
                  parent: animation1, curve: Curves.linearToEaseOut);
              return SlideTransition(
                position: tween.animate(curved),
                child: child,
              );
            });
}

class AligmentRoute extends PageRouteBuilder {
  final Widget page;
  AligmentRoute({required this.page})
      : super(
            pageBuilder: (context, animation1, animation2) => page,
            transitionsBuilder: (context, animation1, animation2, child) {
              return Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: SizeTransition(sizeFactor: animation1,child: child),
              );
            });
}
