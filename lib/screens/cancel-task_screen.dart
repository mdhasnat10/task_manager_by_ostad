import 'package:flutter/material.dart';
import 'package:task_manager_by_ostad/screens/data/model/task_model.dart';
import 'package:task_manager_by_ostad/widgets/task_card.dart';
import 'package:task_manager_by_ostad/widgets/tm_appbar.dart';

class CanceltaskScreen extends StatefulWidget {
  const CanceltaskScreen({super.key});

  @override
  State<CanceltaskScreen> createState() => _CanceltaskScreenState();
}

class _CanceltaskScreenState extends State<CanceltaskScreen> {
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
                    status: 'Cancel',
                    email: ' ',
                    createdDate: '20/10/2026',
                  ),
                  CardColor: Colors.red,
                  refreshParent: () {},
                );
              },
            ),
    );
  }
}