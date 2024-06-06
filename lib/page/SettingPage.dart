import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dataBean/MainViewStateNotify.dart';
import '../dataBean/SongDataList.dart';

class SettingPage extends ConsumerWidget {
  bool _isChange = false;
  List<Color> colors = [
    Colors.deepOrangeAccent,
    Colors.lightBlueAccent,
    Colors.amber
  ];
  var myController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songDataList = ref.watch(songDataListProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "請輸入轉盤項目",
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: songDataList.length,
                  itemBuilder: (BuildContext context, int position) {
                    final item = songDataList[position];
                    return ListTile(
                      title: Text(item.text),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _isChange = true;
                          ref
                              .read(songDataListProvider.notifier)
                              .removeSongData(position);
                        },
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextField(
                      controller: myController,
                      onEditingComplete: () {
                        addNewData(ref, songDataList);
                      },
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        addNewData(ref, songDataList);
                      },
                      child: const Text("新增"))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 25),
              child: TextButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if(_isChange){
                      ref.read(mainViewStateNotifyProvider.notifier).resetCurrentIndex();
                    }
                    Navigator.pop(context);
                  },
                  child: const Text("完成")),
            )
          ],
        ),
      ),
    );
  }

  void addNewData(WidgetRef ref, List<SongData> songDataList) async {
    if (myController.text.isNotEmpty) {
      _isChange = true;
      ref.read(songDataListProvider.notifier).addSongData(SongData(
          id: songDataList.length + 1,
          text: myController.text,
          color: colors[getColorIndex(ref.read(songDataListProvider))]));
      myController.clear();
    }
  }

  int getColorIndex(List<SongData> songDataList) {
    if (songDataList.isEmpty) {
      return 0;
    }

    final index = colors.indexOf(songDataList.last.color);
    if (index == colors.length - 1) {
      return 1;
    }
    return index + 1;
  }
}
