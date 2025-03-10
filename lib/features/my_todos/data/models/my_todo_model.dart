import 'package:hive_ce/hive.dart';

class MyTodoModel extends HiveObject {
  String surahName;
  int fromAyahNumber;
  int toAyahNumber;
  String time;

  MyTodoModel({
    required this.surahName,
    required this.fromAyahNumber,
    required this.toAyahNumber,
    required this.time,
  });
}
