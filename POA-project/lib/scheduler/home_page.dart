import 'package:flutter/material.dart';
import 'package:sukub/progress/progressd.dart';

import 'package:sukub/schedul/add_task.dart';
import 'package:sukub/scheduler/Navigation/navbar.dart';
import 'package:sukub/scheduler/Widgets/bottom_navigation_bar.dart';
import 'package:sukub/scheduler/Widgets/button.dart';
import 'package:sukub/tracker/expense_page.dart';
import 'package:sukub/tracker/widgets/bottomnavigationbar.dart';

import '../schedul/schedulerori.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class Schedulera extends StatefulWidget {
  const Schedulera({Key? key}) : super(key: key);
  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(1);

  @override
  State<Schedulera> createState() => _ScheduleraState();
}

class _ScheduleraState extends State<Schedulera> {
  Icon cusIcon = const Icon(Icons.search);
  Widget cusSearchBar = const Text("POApp");
  final _pages = [
    TodoList(),
    Scheduler(),
    Bottom(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: _appBar(),
      bottomNavigationBar: const SchedulerBottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: Schedulera.selectedIndexNotifier,
          builder: (BuildContext context, updatedIndex, _) {
            return _pages[updatedIndex];
          },
        ),
      ),
    );
  }

  _appBar() {
    return AppBar(
      title: cusSearchBar,
      actions: <Widget>[
        IconButton(
          onPressed: () {
            setState(() {
              if (this.cusIcon.icon == Icons.search) {
                this.cusIcon = const Icon(Icons.cancel);
                this.cusSearchBar = const TextField(
                  textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                );
              } else {
                this.cusIcon = const Icon(Icons.search);
                this.cusSearchBar = const Text("POApp");
              }
            });
          },
          icon: cusIcon,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }
}
