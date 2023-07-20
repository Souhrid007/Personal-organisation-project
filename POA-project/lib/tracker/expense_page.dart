import 'package:flutter/material.dart';

class Expensea extends StatelessWidget {
  const Expensea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Text('Expense Page'),
      ),
    );
  }
}
