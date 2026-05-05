import 'package:flutter/material.dart';
import 'package:task_manager_by_ostad/screens/data/model/task_model.dart';
import 'package:task_manager_by_ostad/widgets/task_card.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: TM_Appbar(),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Task_Card(
            taskModel: TaskModel(
              id: '56',
              title: 'Demo task title',
              description: 'Demo task description',
              status: 'Progress',
              email: ' ',
              createdDate: '20/10/2026',
            ),
            CardColor: Colors.purple,
            refreshParent: () {},
          );
        },
      ),
    );
  }
}