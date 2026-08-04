import 'package:flutter/material.dart';
import 'package:planner/providers/task_provider.dart';
import 'package:provider/provider.dart';

import '../constants/app_colors.dart';
import '../widgets/to_do_element_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchedTasks = context.watch<TaskProvider>().searchedTasks;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search tasks',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.themeColor),
                  ),
                ),

                onChanged: (_) {
                  context.read<TaskProvider>().searchTask(
                    searchedText: _searchController.text,
                  );
                },
              ),
              SizedBox(height: 32),
              Expanded(
                child: ListView.separated(
                  itemCount: searchedTasks.length,
                  separatorBuilder: (_, __) {
                    return SizedBox(height: 16);
                  },
                  itemBuilder: (context, index) {
                    return TodoElementWidget(task: searchedTasks[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
