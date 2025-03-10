import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/features/my_todos/data/models/my_todo_model.dart';
import 'package:muslim/features/my_todos/logic/add_task_cubit/add_task_cubit.dart';
import 'package:muslim/features/my_todos/logic/todos_cubit/todos_cubit.dart';
import 'package:muslim/features/my_todos/logic/todos_cubit/todos_states.dart';
import 'package:muslim/features/my_todos/views/add_task_view.dart';

class MyTodosView extends StatefulWidget {
  const MyTodosView({super.key});

  @override
  State<MyTodosView> createState() => _MyTodosViewState();
}

class _MyTodosViewState extends State<MyTodosView> {
  @override
  initState() {
    super.initState();
    context.read<TodosCubit>().fetchAllTaskes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: Text(
          'My Todo',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: BlocBuilder<TodosCubit, TodosStates>(
        builder: (context, state) {
          if (state is TodosLoadedWithData) {
            List<MyTodoModel> myTodos = context.read<TodosCubit>().tasks!;
            return ListView.builder(
              itemCount: myTodos.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    myTodos[index].delete();
                    context.read<TodosCubit>().fetchAllTaskes();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Task Deleted'),
                      ),
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Surah ${myTodos[index].surahName}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "From Verse :",
                              ),
                              Text(
                                "${myTodos[index].fromAyahNumber}",
                              ),
                              const Text(
                                "To Verse :",
                              ),
                              Text(
                                "${myTodos[index].toAyahNumber}",
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Time :  ',
                              ),
                              Text(
                                myTodos[index].time,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text(
                'No Tasks',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => AddTaskCubit(),
                child: const AddTaskView(),
              ),
            ),
          );
        },
      ),
    );
  }
}
