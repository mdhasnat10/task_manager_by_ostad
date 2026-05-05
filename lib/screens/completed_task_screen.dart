

import 'package:flutter/material.dart';
import 'package:task_manager_by_ostad/screens/data/model/task_model.dart';
import 'package:task_manager_by_ostad/widgets/task_card.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Task_Card(
            taskModel: TaskModel(
              id: '56',
              title: 'Demo task title',
              description: 'Demo task description',
              status: 'Completed',
              email: ' ',
              createdDate: '20/10/2026',
            ),
            CardColor: Colors.green,
            refreshParent: () {},
          );
        },
      ),
    );
  }
}