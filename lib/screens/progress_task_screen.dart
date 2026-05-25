import 'package:flutter/material.dart';
import 'package:task_manager_by_ostad/screens/data/model/api_response.dart';
import 'package:task_manager_by_ostad/screens/data/model/task_model.dart';
import 'package:task_manager_by_ostad/screens/data/model/task_status_count_model.dart';
import 'package:task_manager_by_ostad/screens/data/service/api_caller.dart';
import 'package:task_manager_by_ostad/utils/url.dart';
import 'package:task_manager_by_ostad/widgets/task_card.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllNewTask();
  }

  List<TaskModel> allTask = [];

  Future<void> getAllNewTask() async {
    final ApiResponse response = await ApiCaller.getRequest(
      URL: Urls.taskByStatusURL('Progress'),
    );

    List<TaskModel> task = [];
    if (response.isSuccess) {
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        task.add(TaskModel.fromJson(jsonData));
      }
      ;
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(response.responseData['data'])));
    }

    setState(() {
      allTask = task;
      print(response.responseData);
      print(allTask.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: TM_Appbar(),
      body: ListView.builder(
        itemCount: allTask.length,
        itemBuilder: (context, index) {
          return Task_Card(
            taskModel: allTask[index],
            CardColor: Colors.purple,
            refreshParent: () {
              getAllNewTask();
            },
          );
        },
      ),
    );
  }
}
