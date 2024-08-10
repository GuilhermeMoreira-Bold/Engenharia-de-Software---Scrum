import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/task_provider.dart';
import 'package:todo_list/screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
