import 'package:flutter/material.dart';
import 'package:task_manager_by_ostad/screens/data/model/api_response.dart';
import 'package:task_manager_by_ostad/screens/data/model/task_model.dart';
import 'package:task_manager_by_ostad/screens/data/service/api_caller.dart';
import 'package:task_manager_by_ostad/utils/app_colors.dart';
import 'package:task_manager_by_ostad/utils/url.dart';

class Task_Card extends StatefulWidget {
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
  State<Task_Card> createState() => _Task_CardState();
}

class _Task_CardState extends State<Task_Card> {
  Future<void> changeStatus(String status) async {
    final ApiResponse response = await ApiCaller.getRequest(
      URL: Urls.taskStatusUpdateURL(widget.taskModel.id.toString(), status),
    );

    setState(() {
      print(response.responseData);
    });

    if (response.isSuccess) {
      widget.refreshParent();
      Navigator.pop(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: const Text('Task Status Updated')));
      ;
    } else {
      Navigator.pop(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(response.responseData['data'])));
    }
  }

  void showChangedStatusDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Change Task Status'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              color: widget.taskModel.status == 'New' ? Colors.green : null,
              child: ListTile(
                title: const Text('New'),
                onTap: () {
                  changeStatus('New');
                },
                trailing: widget.taskModel.status == 'New'
                    ? Icon(Icons.check_box_outlined, color: Colors.white)
                    : null,
              ),
            ),
            Card(
              color: widget.taskModel.status == 'Progess' ? Colors.green : null,
              child: ListTile(
                title: const Text('Progress'),
                onTap: () {
                  changeStatus('Progress');
                },
                trailing: widget.taskModel.status == 'Progress'
                    ? Icon(Icons.check_box_outlined, color: Colors.white)
                    : null,
              ),
            ),
            Card(
              color: widget.taskModel.status == 'Completed'
                  ? Colors.green
                  : null,
              child: ListTile(
                title: const Text('Completed'),
                onTap: () {
                  changeStatus('Completed');
                },
                trailing: widget.taskModel.status == 'Completed'
                    ? Icon(Icons.check_box_outlined, color: Colors.white)
                    : null,
              ),
            ),
            Card(
              color: widget.taskModel.status == 'Cancelled'
                  ? Colors.green
                  : null,
              child: ListTile(
                title: const Text('Cancelled'),
                onTap: () {
                  changeStatus('Cancelled');
                },
                trailing: widget.taskModel.status == 'Cancelled'
                    ? Icon(Icons.check_box_outlined, color: Colors.white)
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        child: ListTile(
          title: Text(
            widget.taskModel.title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontSize: 20),
          ),
          subtitle: Column(
            crossAxisAlignment: .start,
            children: [
              const SizedBox(height: 10),
              Text(
                widget.taskModel.description,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 5),
              Text(
                'Date: ${widget.taskModel.createdDate}',
                style: TextStyle(fontSize: 12, fontWeight: .w500),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Chip(
                    label: Text(
                      widget.taskModel.status,
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    backgroundColor: widget.CardColor,
                  ),

                  Spacer(),

                  IconButton(
                    onPressed: () {
                      showChangedStatusDialog();
                    },
                    icon: Icon(Icons.edit, color: AppColors.Pcolor),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete, color: Colors.red),
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
