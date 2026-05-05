import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_by_ostad/utils/app_colors.dart';
import 'package:task_manager_by_ostad/widgets/screen_bg.dart';
import 'package:task_manager_by_ostad/widgets/tm_appbar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TM_Appbar(),
      body: Screen_BG(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: .start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 150),
              Text(
                'Add New Task',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Title')),
              SizedBox(height: 15),
              TextFormField(
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: 'Description'),
              ),
              SizedBox(height: 15),
              FilledButton(
                onPressed: () {},
                child: Icon(Icons.arrow_circle_right_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
