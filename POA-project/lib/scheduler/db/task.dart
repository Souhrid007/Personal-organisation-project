import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Task {
  final String title;
  final String note;
  final DateTime date;
  final String startTime;
  final String endTime;
  final int remind;
  final String repeat;
  final int color;
  bool isSelected;
  Task({
    required this.title,
    required this.note,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.remind,
    required this.repeat,
    required this.color,
    this.isSelected = false,
  });

  get createdAtTime => null;
}

class TaskManager {
  final String _boxName = 'tasks';
  static ValueNotifier<List<Task>> taskList = ValueNotifier([]);
  Future<void> addTask(Task task) async {
    final box = await Hive.openBox<Task>(_boxName);
    await box.add(task);
    await box.close();
  }

  Future<List<Task>> getTasks() async {
    final box = await Hive.openBox<Task>(_boxName);
    final tasks = box.values.toList();
    await box.close();
    return tasks;
  }

  Future<List<Task>> deleteTask(int? id) async {
    final box = await Hive.openBox<Task>(_boxName);
    print("Delete");
    if (id != null) {
      await box.deleteAt(id);
    }
    final tasks = box.values.toList();
    taskList.value = box.values.toList();
    taskList.notifyListeners();
    return tasks;
  }
}
