// ignore_for_file: avoid_returning_null_for_void, duplicate_ignore

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:sukub/progress/progressd.dart';
import 'package:sukub/scheduler/home_page.dart';
import 'package:sukub/tracker/expense_page.dart';
import 'package:sukub/tracker/widgets/bottomnavigationbar.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        scrollDirection: Axis.vertical,
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Oflutter.com'),
            accountEmail: const Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://wallpapercave.com/wp/nr46xmc.jpg',
                  fit: BoxFit.cover,
                  width: 75,
                  height: 75,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image:
                      NetworkImage('https://wallpapercave.com/wp/nr46xmc.jpg')),
            ),
          ),
          // ignore: duplicate_ignore
          ListTile(
            leading: const Icon(Icons.account_box),
            title: const Text('Account'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Progress'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return TodoList();
                  },
                ),
              );
            },
          ),
          ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Scheduler'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const Schedulera();
                    },
                  ),
                );
              }),
          ListTile(
              leading: const Icon(Icons.attach_money),
              title: const Text('Transactions'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const Bottom();
                    },
                  ),
                );
              }),
          const ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Policies'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => null,
          ),
          const Divider(),
          ListTile(
            title: const Text('Exit'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    );
  }
}
