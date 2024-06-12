import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_turntable_learning_app/dataBean/MainViewStateNotify.dart';

import '../dataBean/SongDataList.dart';
import '../widget/TriangleWidget.dart';
import '../widget/TurntableWidget.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage>
    with TickerProviderStateMixin {
  late Animation<double> _angleAnimation;
  late AnimationController _angleController;
  var _angle = 0.0;
  var _prizeResult = 0.0;

  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ///获取输入框焦点
      FocusScope.of(context).requestFocus(_focusNode);
    });

    _angleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
      upperBound: 1.0,
      lowerBound: 0.0,
    );
    _angleAnimation =
        CurvedAnimation(parent: _angleController, curve: Curves.easeOutCirc)
          ..addListener(() {
            if (mounted) {
              setState(() {
                _angle = _angleAnimation.value * 0.75;
              });
            }
          });
  }

  @override
  Widget build(BuildContext context) {
    List<SongData> songDataList = ref.watch(songDataListProvider);
    MainViewState mainViewState = ref.watch(mainViewStateNotifyProvider);

    return Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(10, 30, 10, 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints.expand(height: 35),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        "Flutter 大輪盤",
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Positioned(
                          right: 10,
                          child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/setting_page');
                              },
                              child: const Text(
                                "設定",
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ))),
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Transform.rotate(
                      angle: _angle * (pi * 2) - _prizeResultPi,
                      child: TurntableWidget(songDataList),
                    ),
                    Trianglewidget(),
                  ],
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(Colors.redAccent),
                        elevation: WidgetStateProperty.all(20),
                        shape: WidgetStateProperty.all(
                          const CircleBorder(
                              side: BorderSide(color: Colors.redAccent)),
                        )),
                    onPressed: () {
                      if (mainViewState.currentIndex != -1) {
                        ref
                            .read(songDataListProvider.notifier)
                            .removeSongData(mainViewState.currentIndex);
                      }
                      goDraw();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "GO",
                        style: TextStyle(fontSize: 70, color: Colors.white60),
                      ),
                    )),
              ],
            ),
          ),);
  }

  void goDraw() async {
    List<SongData> songDataList = ref.watch(songDataListProvider);
    print("Random SongData:$songDataList");
    if (songDataList.isEmpty) {
      return;
    }
    var index = Random().nextInt(songDataList.length);
    print("Random index:$index");
    ref.read(mainViewStateNotifyProvider.notifier).updateCurrentIndex(index);
    _prizeResult = (index / (songDataList.length)) + _midTweenDouble;
    _angleController.forward(from: 0);
  }

  double get _midTweenDouble {
    List<SongData> songDataList = ref.watch(songDataListProvider);
    if (songDataList.isEmpty) {
      return 0;
    }
    double piTween = 1 / (songDataList.length);
    double midTween = piTween / 2;
    return midTween;
  }

  double get _prizeResultPi {
    return _prizeResult * pi * 2;
  }
}
