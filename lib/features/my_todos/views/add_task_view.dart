// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/core/helper/local_notifications_service.dart';
import 'package:muslim/features/my_todos/data/models/my_todo_model.dart';
import 'package:muslim/features/my_todos/logic/add_task_cubit/add_task_cubit.dart';
import 'package:muslim/features/my_todos/logic/add_task_cubit/add_task_states.dart';
import 'package:muslim/features/my_todos/logic/todos_cubit/todos_cubit.dart';
import 'package:muslim/features/settings/presentation/view_model/change_font_cubit/change_font_cubit.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  TimeOfDay selectedTime = TimeOfDay.now();
  String? time;
  TextEditingController surahNameController = TextEditingController();
  TextEditingController ayahFromController = TextEditingController();
  TextEditingController ayahToController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Add Task"),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.name,
              controller: surahNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Surah Name',
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: ayahFromController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'from Ayah',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: ayahToController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'to Ayah',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: timePicker(context),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () async {
                int id = await context.read<AddTaskCubit>().addNewTask(
                      MyTodoModel(
                        surahName: surahNameController.text,
                        fromAyahNumber:
                            int.parse(ayahFromController.text.trim()),
                        toAyahNumber: int.parse(ayahToController.text.trim()),
                        time: time ?? selectedTime.format(context),
                      ),
                    );

                if (BlocProvider.of<ChangeNotificationCubit>(context)
                    .isEnabled) {
                  await LocalNotificationsService.scheduleNotification(
                    id: id,
                    title: "Pray for ${surahNameController.text.trim()}",
                    body:
                        "from Ayah ${ayahFromController.text.trim()} to Ayah ${ayahToController.text.trim()}",
                    hour: selectedTime.hour,
                    minute: selectedTime.minute,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "Save",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'Kalam',
                ),
              ),
            ),
          ),
          BlocListener<AddTaskCubit, AddTaskStates>(
            listener: (context, state) {
              if (state is AddTaskSuccessState) {
                BlocProvider.of<TodosCubit>(context).fetchAllTaskes();
                Navigator.pop(context);
                Navigator.pop(context);
              } else if (state is AddTaskErrorState) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error)));
              } else {
                showDialog(
                  context: context,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
            child: const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  @override
  dispose() {
    surahNameController.dispose();
    ayahFromController.dispose();
    ayahToController.dispose();
    super.dispose();
  }

  Widget timePicker(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[300],
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Text(
            selectedTime.format(context),
            style: const TextStyle(
                fontSize: 20, color: Colors.black, fontFamily: 'Kalam'),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              showTimePicker(
                context: context,
                initialTime: selectedTime,
              ).then((value) {
                if (value != null) {
                  setState(() {
                    selectedTime = value;
                    time = selectedTime.format(context);
                  });
                }
              });
            },
            icon: const Icon(Icons.alarm),
            color: Colors.black,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
