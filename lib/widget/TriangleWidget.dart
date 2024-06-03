import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'TriangleDrawPointer.dart';

class Trianglewidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomPaint(
      size: Size(25, 25),
      painter: TriangleWidget(),
    );
  }
}
