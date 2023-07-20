import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sukub/schedul/add_task.dart';

import 'package:sukub/scheduler/Widgets/button.dart';
import 'package:sukub/scheduler/db/task.dart';
import 'package:sukub/scheduler/themes.dart';

class color {}

class Scheduler extends StatefulWidget {
  const Scheduler({super.key});

  @override
  State<Scheduler> createState() => _SchedulerState();
}

class _SchedulerState extends State<Scheduler> {
  final DateTime _selectedDate = DateTime.now();
  List<Task> tasks = []; //
  TaskManager taskManager =
      TaskManager(); // Create an instance of TaskManagerList to store tasks

  var notifyhelper;
  @override
  void initState() {
    super.initState();
    _fetchTasks(); // Fetch tasks when the widget is initialized
  }

  void _fetchTasks() async {
    // Retrieve tasks from your TaskManager or any other data source
    List<Task> fetchedTasks = await taskManager.getTasks();
    setState(() {
      tasks = fetchedTasks;
    });
  }

  // Method to navigate to the AddTaskS screen
  _navigateToAddTaskS(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddTaskS()),
    );

    // Handle the result returned from AddTaskS screen
    if (result != null && result is Task) {
      // Handle the task data here
      // Add the task to your list or perform any other required operations
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _addTaskBar(),
            _addDateBar(),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: TaskManager.taskList,
                builder: (context, value, child) {
                  return ListView.separated(
                    separatorBuilder: ((context, index) {
                      return const SizedBox(height: 2);
                    }),
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      Task task = tasks[index];
                      return Card(
                        color: index == 0
                            ? Colors.amber
                            : index == 1
                                ? Colors.red
                                : Colors.orange,
                        elevation: 30,
                        child: ListTile(
                          leading: const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.blue,
                            child: Text(""),
                          ),
                          title: Text(task.title),
                          subtitle: Text(task.note),
                          trailing: IconButton(
                              onPressed: () {
                                int? id = int.tryParse(task.startTime);
                                TaskManager().deleteTask(id);
                              },
                              icon: const Icon(Icons.delete)),
                          // Display other task information as desired
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.blue,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        onDateChange: (date) {
          var _selectedDate = date;
          var selecteddate = DateFormat().add_MMMd().format(date);
          final splitdate = selecteddate.split('');
        },
      ),
    );
  }

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(left: 10, top: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: headingStyle,
              ),
              Text(
                "Today",
                style: subHeadingStyle,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 160),
            child: ElevatedButton(
                child: const Text("+Add"),
                onPressed: () {
                  _navigateToAddTaskS(context);
                }),
          ),
        ],
      ),
    );
  }
}
