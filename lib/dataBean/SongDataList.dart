import 'dart:ui';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'SongDataList.freezed.dart';
part 'SongDataList.g.dart';

//反方向的鐘 半獸人 上海1943 懦夫 三年二班 龍捲風 安靜

@riverpod
class SongDataList extends _$SongDataList{
  @override
  List<SongData> build() => [];

  void addSongData(SongData songData) {
    state = [...state, songData];
  }
  void removeSongData(int position){
    state = [...state..removeAt(position)];
  }
}

@freezed
class SongData with _$SongData{
  factory SongData({
    required int id,
    required String text,
    required Color color,
  }) = _SongData;
}


