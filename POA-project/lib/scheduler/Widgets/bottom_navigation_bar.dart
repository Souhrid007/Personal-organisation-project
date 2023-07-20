import 'package:flutter/material.dart';
import 'package:sukub/scheduler/home_page.dart';

class SchedulerBottomNavigation extends StatelessWidget {
  const SchedulerBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Schedulera.selectedIndexNotifier,
      builder: (BuildContext context, int updatedIndex, Widget? _) {
        return BottomNavigationBar(
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.black,
          currentIndex: updatedIndex,
          onTap: (newIndex) {
            Schedulera.selectedIndexNotifier.value = newIndex;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Progress',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Scheduler',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money),
              label: 'Transactions',
            ),
          ],
        );
      },
    );
  }
}
