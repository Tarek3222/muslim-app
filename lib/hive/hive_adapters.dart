import 'package:hive_ce/hive.dart';
import 'package:muslim/features/my_todos/data/models/my_todo_model.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([AdapterSpec<MyTodoModel>()])
// Annotations must be on some element
// ignore: unused_element
void _() {}
