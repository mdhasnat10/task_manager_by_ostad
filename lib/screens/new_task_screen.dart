import 'package:flutter/material.dart';
import 'package:task_manager_by_ostad/screens/add_new_task_screen.dart';
import 'package:task_manager_by_ostad/screens/data/model/api_response.dart';
import 'package:task_manager_by_ostad/screens/data/model/task_model.dart';
import 'package:task_manager_by_ostad/screens/data/model/task_status_count_model.dart';
import 'package:task_manager_by_ostad/screens/data/service/api_caller.dart';
import 'package:task_manager_by_ostad/utils/app_colors.dart';
import 'package:task_manager_by_ostad/utils/url.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTaskCount();
    getAllNewTask();
  }

  List<TaskStatusCountModel> taskCountByStatus = [];
  List<TaskModel> newtask = [];

  Future<void> getAllTaskCount() async {
    final ApiResponse response = await ApiCaller.getRequest(
      URL: Urls.getTaskCountURL,
    );

    List<TaskStatusCountModel> taskCount = [];
    if (response.isSuccess) {
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        taskCount.add(TaskStatusCountModel.fromJson(jsonData));
      }
      ;
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(response.responseData['data'])));
    }

    setState(() {
      taskCountByStatus = taskCount;
      print(response.responseData);
      print(taskCount);
      print(taskCountByStatus);
    });
  }

  Future<void> getAllNewTask() async {
    final ApiResponse response = await ApiCaller.getRequest(
      URL: Urls.taskByStatusURL('New'),
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
      newtask = task;
      print(response.responseData);
      print(newtask.length);
    });
  }

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
                itemCount: taskCountByStatus.length,
                scrollDirection: .horizontal,
                itemBuilder: (context, index) {
                  return TaskContByStatus(
                    title: taskCountByStatus[index].sId.toString(),
                    count: taskCountByStatus[index].sum!.toInt(),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 20);
                },
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: newtask.length,
              itemBuilder: (context, index) {
                var task = newtask[index];
                return Task_Card(
                  taskModel: newtask[index],
                  CardColor: Colors.blue,
                  refreshParent: () {
                    getAllTaskCount();
                    getAllNewTask();
                  },
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
