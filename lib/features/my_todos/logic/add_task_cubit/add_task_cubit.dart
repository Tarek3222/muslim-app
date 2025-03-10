import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce/hive.dart';
import 'package:muslim/features/my_todos/data/models/my_todo_model.dart';
import 'package:muslim/features/my_todos/logic/add_task_cubit/add_task_states.dart';

class AddTaskCubit extends Cubit<AddTaskStates> {
  AddTaskCubit() : super(AddTaskInitialState());

  Future<int> addNewTask(MyTodoModel taskModel) async {
    emit(AddTaskLoadingState());
    try {
      var box = Hive.box<MyTodoModel>("my_todos");
      int id = await box.add(taskModel);
      emit(AddTaskSuccessState());
      return id;
    } catch (e) {
      emit(AddTaskErrorState(e.toString()));
      return -1;
    }
  }
}
