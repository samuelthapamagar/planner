import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../widgets/delete_task_element.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Completed Tasks', style: kHeadingTextStyle1),
                  GestureDetector(
                    onTap: () {},
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Delete all',
                        style: kBodyTextStyle.copyWith(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Expanded(
                child: ListView.separated(
                  itemCount: 20,
                  itemBuilder: (context, index) => DeleteTaskElement(),
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
