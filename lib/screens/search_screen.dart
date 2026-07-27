import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../widgets/to_do_element_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
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

                onChanged: (val) {},
              ),
              SizedBox(height: 32),
              Expanded(
                child: ListView.separated(
                  itemCount: 10,
                  separatorBuilder: (_, __) {
                    return SizedBox(height: 16);
                  },
                  itemBuilder: (context, index) {
                    return SizedBox.shrink();
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
