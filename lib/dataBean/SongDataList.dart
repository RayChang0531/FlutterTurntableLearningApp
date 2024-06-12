import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'SongDataList.freezed.dart';

part 'SongDataList.g.dart';

@riverpod
class SongDataList extends _$SongDataList {
  List<Color> colors = [
    Colors.deepOrangeAccent,
    Colors.lightBlueAccent,
    Colors.amber,
  ];

  @override
  List<SongData> build() => [];

  void addSongs(String text) {
    final textList = text.split(" ");
    print("addSongs textList :${textList}");
    for (final text in textList) {
      final inputText = text.trim();
      print("addSongs text :$text");
      if (inputText.isEmpty) {
        continue;
      }
      print("addSongs not continue");
      state = [
        ...state,
        SongData(
            id: state.length + 1,
            text: inputText,
            color: colors[getColorIndex(state)])
      ];
    }
  }

  void removeSongData(int position) {
    state = [...state..removeAt(position)];
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

@freezed
class SongData with _$SongData {
  factory SongData({
    required int id,
    required String text,
    required Color color,
  }) = _SongData;
}
