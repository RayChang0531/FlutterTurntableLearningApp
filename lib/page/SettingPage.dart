import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dataBean/MainViewStateNotify.dart';
import '../dataBean/SongDataList.dart';

class SettingPage extends ConsumerWidget {
  bool _isChange = false;
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
              "設定",
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
                        addNewData(ref);
                      },
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        addNewData(ref);
                      },
                      child: const Text("新增項目"))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 25),
              child: TextButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (_isChange) {
                      ref
                          .read(mainViewStateNotifyProvider.notifier)
                          .resetCurrentIndex();
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

  void addNewData(WidgetRef ref) async {
    if (myController.text.isNotEmpty) {
      _isChange = true;
      print("text: ${myController.text}");
      ref.read(songDataListProvider.notifier).addSongs(myController.text);
      myController.clear();
    }
  }
}
