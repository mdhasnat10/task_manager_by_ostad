import 'package:flutter/material.dart';
import 'package:task_manager_by_ostad/screens/data/model/api_response.dart';
import 'package:task_manager_by_ostad/screens/data/model/task_model.dart';
import 'package:task_manager_by_ostad/screens/data/model/task_status_count_model.dart';
import 'package:task_manager_by_ostad/screens/data/service/api_caller.dart';
import 'package:task_manager_by_ostad/utils/url.dart';
import 'package:task_manager_by_ostad/widgets/task_card.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllNewTask();
  }

  List<TaskModel> allTask = [];

  Future<void> getAllNewTask() async {
    final ApiResponse response = await ApiCaller.getRequest(
      URL: Urls.taskByStatusURL('Completed'),
    );

    List<TaskModel> task = [];
    if (response.isSuccess) {
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        task.add(TaskModel.fromJson(jsonData));
      }
      ;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text('Failed to fetch completed tasks... ')),
      );
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
            CardColor: Colors.green,
            refreshParent: () {
              getAllNewTask();
            },
          );
        },
      ),
    );
  }
}
