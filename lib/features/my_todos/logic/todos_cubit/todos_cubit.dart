import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce/hive.dart';
import 'package:muslim/features/my_todos/data/models/my_todo_model.dart';
import 'package:muslim/features/my_todos/logic/todos_cubit/todos_states.dart';

class TodosCubit extends Cubit<TodosStates> {
  TodosCubit() : super(const TodosInitial());
  List<MyTodoModel>? tasks;
  void fetchAllTaskes() {
    var noteBox = Hive.box<MyTodoModel>('my_todos');
    tasks = noteBox.values.toList();
    if (tasks!.isNotEmpty) {
      emit(const TodosLoadedWithData());
    } else {
      emit(const TodosLoadedWithNoData());
    }
  }
}
