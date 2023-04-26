import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'size_extension.dart';

class RPadding extends SingleChildRenderObjectWidget {
  const RPadding({
    Key? key,
    required Widget child,
    required this.padding,
  }) : super(key: key, child: child);

  final EdgeInsets padding;

  @override
  RenderPadding createRenderObject(BuildContext context) {
    return RenderPadding(
      padding: padding is REdgeInsets ? padding : padding.r,
      textDirection: Directionality.maybeOf(context),
    );
  }
}

class REdgeInsets extends EdgeInsets {
  REdgeInsets.fromLTRB(double left, double top, double right, double bottom)
      : super.fromLTRB(left.r, top.r, right.r, bottom.r);

  REdgeInsets.all(double value) : super.all(value.r);

  REdgeInsets.symmetric({
    double vertical = 0,
    double horizontal = 0,
  }) : super.symmetric(vertical: vertical.r, horizontal: horizontal.r);

  REdgeInsets.only({
    double bottom = 0,
    double right = 0,
    double left = 0,
    double top = 0,
  }) : super.only(
          bottom: bottom.r,
          right: right.r,
          left: left.r,
          top: top.r,
        );
}

class REdgeInsetsDirectional extends EdgeInsetsDirectional {
  REdgeInsetsDirectional.all(double value) : super.all(value.r);

  REdgeInsetsDirectional.only({
    double bottom = 0,
    double end = 0,
    double start = 0,
    double top = 0,
  }) : super.only(
          bottom: bottom.r,
          start: start.r,
          end: end.r,
          top: top.r,
        );

  REdgeInsetsDirectional.fromSTEB(
    double start,
    double top,
    double end,
    double bottom,
  ) : super.fromSTEB(
          start.r,
          top.r,
          end.r,
          bottom.r,
        );
}
