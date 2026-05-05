import 'package:flutter/material.dart';
import 'package:task_manager_by_ostad/screens/data/model/task_model.dart';
import 'package:task_manager_by_ostad/utils/app_colors.dart';

class Task_Card extends StatelessWidget {
  final TaskModel taskModel;
  final Color CardColor;
  final VoidCallback refreshParent;
  const Task_Card({
    super.key,
    required this.taskModel,
    required this.CardColor,
    required this.refreshParent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        child: ListTile(
          title: Text(
            taskModel.title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontSize: 20),
          ),
          subtitle: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 10),
              Text(
                taskModel.description,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SizedBox(height: 5),
              Text(
                'Date: ${taskModel.createdDate}',
                style: TextStyle(fontSize: 12, fontWeight: .w500),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Chip(
                    label: Text(
                      taskModel.status,
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    backgroundColor: CardColor,
                  ),

                  Spacer(),

                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit, color: AppColors.Pcolor),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete, color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
