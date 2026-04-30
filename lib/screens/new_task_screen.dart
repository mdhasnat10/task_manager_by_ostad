import 'package:flutter/material.dart';
import 'package:task_manager_by_ostad/utils/app_colors.dart';
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
      appBar: TM_Appbar(),
      body: Column(
        children: [
          

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 90,
              child: ListView.separated(
                scrollDirection: .horizontal,
                itemBuilder: (context, index){
                  return TaskContByStatus(title: 'New', count: 5,);
                }, 
                separatorBuilder: (context, index) {
                  return SizedBox(width: 20,);
                }, 
                itemCount: 4),
            ),
          ),
        ],
      ),
    );
  }
}


