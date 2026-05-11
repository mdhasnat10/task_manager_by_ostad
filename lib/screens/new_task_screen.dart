import 'package:flutter/material.dart';
import 'package:task_manager_by_ostad/screens/add_new_task_screen.dart';
import 'package:task_manager_by_ostad/screens/data/model/task_model.dart';
import 'package:task_manager_by_ostad/utils/app_colors.dart';
import 'package:task_manager_by_ostad/widgets/task_card.dart';
import 'package:task_manager_by_ostad/widgets/task_count_by_status.dart';
import 'package:task_manager_by_ostad/widgets/tm_appbar.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: TM_Appbar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 90,
              child: ListView.separated(
                scrollDirection: .horizontal,
                itemBuilder: (context, index) {
                  return TaskContByStatus(title: 'New', count: 5);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 20);
                },
                itemCount: 4,
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Task_Card(
                  taskModel: TaskModel(
                    id: '56',
                    title: 'Demo task title',
                    description: 'Demo task description',
                    status: 'New',
                    email: ' ',
                    createdDate: '20/10/2026',
                  ),
                  CardColor: Colors.blue,
                  refreshParent: () {},
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.Pcolor,
        elevation: 5,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(50),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewTaskScreen()),
          );
        },

        child: Icon(Icons.add),
      ),
    );
  }
}
