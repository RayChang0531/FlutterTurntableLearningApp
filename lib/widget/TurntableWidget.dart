import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dataBean/SongDataList.dart';
import 'TurntableDrawPointer.dart';

class TurntableWidget extends ConsumerWidget {
  List<SongData> songData;

  TurntableWidget(this.songData, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: CustomPaint(
      size: Size(400, 400),
      painter: TurntableDrawPointer(songData),
    ),);
  }
}
