import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planner/screens/search_screen.dart';

import '../constants/app_colors.dart';
import '../widgets/add_task_sheet.dart';
import 'done_screen.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  List screens = [HomeScreen(), HomeScreen(), SearchScreen(), DoneScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(child: screens[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        onTap: (val) {
          setState(() => currentIndex = val);
          if (currentIndex == 1) {
            showModalBottomSheet(
              context: context,
              builder: (context) => AddTaskSheet(),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/todo_list.png',
              scale: 2,
              color: currentIndex == 0 ? AppColors.themeColor : Colors.grey,
            ),
            label: 'Todo',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/plus_outlined.png',
              scale: 2,
              color: currentIndex == 1 ? AppColors.themeColor : Colors.grey,
            ),

            label: 'Create',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/checked_outlined.png',

              color: currentIndex == 3 ? AppColors.themeColor : Colors.grey,
            ),

            label: 'Done',
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 26),
        child: Icon(Icons.check_box, color: AppColors.themeColor, size: 30),
      ),
      title: Text(
        'Taski',
        style: GoogleFonts.urbanist(fontSize: 22, fontWeight: FontWeight.w800),
      ),
      centerTitle: false,
      actions: [
        Text(
          'taski',
          style: GoogleFonts.urbanist(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 12),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
            ),
          ),
        ),
        SizedBox(width: 26),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
