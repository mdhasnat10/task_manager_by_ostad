import 'package:flutter/material.dart';
import 'package:task_manager_by_ostad/screens/cancel-task_screen.dart';
import 'package:task_manager_by_ostad/screens/completed_task_screen.dart';
import 'package:task_manager_by_ostad/screens/new_task_screen.dart';
import 'package:task_manager_by_ostad/screens/progress_task_screen.dart';
import 'package:task_manager_by_ostad/widgets/tm_appbar.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _selectedIndex = 0;

  List _screen = [
    NewTaskScreen(),
    ProgressTaskScreen(),
    CompletedTaskScreen(),
    CanceltaskScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TM_Appbar(),
      body: _screen[_selectedIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        
        destinations: [
         NavigationDestination(icon: Icon(Icons.task), label: 'New'),
         NavigationDestination(icon: Icon(Icons.refresh), label: 'Progress'),
         NavigationDestination(icon: Icon(Icons.done_all_outlined), label: 'Completed'),
         NavigationDestination(icon: Icon(Icons.cancel), label: 'Cancel'),

      ]),
    );
  }
}