
import 'package:flutter/material.dart';
import 'package:task_manager_by_ostad/widgets/screen_bg.dart';
import 'package:task_manager_by_ostad/widgets/tm_appbar.dart';

class UpdaeProfileScreen extends StatefulWidget {
  const UpdaeProfileScreen({super.key});

  @override
  State<UpdaeProfileScreen> createState() => _UpdaeProfileScreenState();
}

class _UpdaeProfileScreenState extends State<UpdaeProfileScreen> {
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
              SizedBox(height: 100),
              Text(
                'Update Profile',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 15,),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8), 
                          bottomLeft: Radius.circular(8))
                          ),
                      child: Text('Photos', style: TextStyle(color: Colors.white),),
                    ),
                    Expanded(child: Text(' Upload Image'))
                  ],
                ),
              ),
              SizedBox(height: 15),
              TextFormField(decoration: InputDecoration(hintText: 'Email')),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(hintText: 'First Name'),
              ),
              SizedBox(height: 15),
              TextFormField(decoration: InputDecoration(hintText: 'Last Name')),
              SizedBox(height: 15),
              TextFormField(decoration: InputDecoration(hintText: 'Mobile')),
              SizedBox(height: 15),
              TextFormField(decoration: InputDecoration(hintText: 'Password')),
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