import 'package:flutter/material.dart';

class TaskContByStatus extends StatelessWidget {
  final String title;
  final int count;
  const TaskContByStatus({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 75,
      
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow:[
           BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 5,
            offset: Offset(0, 3)
           )]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Text(count.toString(), style: Theme.of(context).textTheme.titleLarge),
            Text(title),
          ],
        ),
      ),
    );
  }
}
