import 'package:flutter/material.dart';
import 'package:task_manager_by_ostad/screens/data/model/api_response.dart';
import 'package:task_manager_by_ostad/screens/data/model/task_model.dart';
import 'package:task_manager_by_ostad/screens/data/model/task_status_count_model.dart';
import 'package:task_manager_by_ostad/screens/data/service/api_caller.dart';
import 'package:task_manager_by_ostad/utils/url.dart';
import 'package:task_manager_by_ostad/widgets/task_card.dart';

class CanceltaskScreen extends StatefulWidget {
  const CanceltaskScreen({super.key});

  @override
  State<CanceltaskScreen> createState() => _CanceltaskScreenState();
}

class _CanceltaskScreenState extends State<CanceltaskScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTask();
  }

  List<TaskModel> allTask = [];

  Future<void> getAllTask() async {
    final ApiResponse response = await ApiCaller.getRequest(
      URL: Urls.taskByStatusURL('Cancelled'),
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
            CardColor: Colors.red,
            refreshParent: () {
              getAllTask();
            },
          );
        },
      ),
    );
  }
}
