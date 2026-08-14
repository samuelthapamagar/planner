import 'package:flutter/material.dart';
import 'package:planner/providers/app_auth_provider.dart';
import 'package:planner/providers/task_provider.dart';
import 'package:planner/screens/search_screen.dart';
import 'package:provider/provider.dart';
import '../widgets/add_task_sheet.dart';
import '../widgets/custom_app_bar.dart';
import 'done_screen.dart';
import 'home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  void init() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TaskProvider>().fetchAllTasks();

      context.read<AppAuthProvider>().getUserData();
    });
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          currentIndex = index;
          if (index == 1) {
            showModalBottomSheet(
              backgroundColor: Colors.white,
              context: context,
              builder: (context) {
                return AddTaskSheet();
              },
            );
          }

          //dragablescrollablesheet
          setState(() {});
        },
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/todo_list.png',
              scale: 2,
              color: currentIndex == 0 ? Colors.blue : Colors.grey,
            ),
            label: 'Todo',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/plus_outlined.png',
              scale: 2,
              color: currentIndex == 1 ? Colors.blue : Colors.grey,
            ),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: currentIndex == 2 ? Colors.blue : Colors.grey,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/checked_outlined.png',
              color: currentIndex == 3 ? Colors.blue : Colors.grey,
            ),

            label: 'Done',
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [HomeScreen(), HomeScreen(), SearchScreen(), DoneScreen()],
      ),
    );
  }
}

// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});
//
//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//   int currentIndex = 0;
//
//   List screens = [HomeScreen(), HomeScreen(), SearchScreen(), DoneScreen()];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(),
//       body: SafeArea(child: screens[currentIndex]),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.shifting,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         showUnselectedLabels: true,
//         currentIndex: currentIndex,
//         onTap: (val) {
//           setState(() => currentIndex = val);
//           if (currentIndex == 1) {
//             showModalBottomSheet(
//               context: context,
//               builder: (context) => AddTaskSheet(),
//             );
//           }
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Image.asset(
//               'assets/icons/todo_list.png',
//               scale: 2,
//               color: currentIndex == 0 ? AppColors.themeColor : Colors.grey,
//             ),
//             label: 'Todo',
//           ),
//           BottomNavigationBarItem(
//             icon: Image.asset(
//               'assets/icons/plus_outlined.png',
//               scale: 2,
//               color: currentIndex == 1 ? AppColors.themeColor : Colors.grey,
//             ),
//
//             label: 'Create',
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
//           BottomNavigationBarItem(
//             icon: Image.asset(
//               'assets/icons/checked_outlined.png',
//
//               color: currentIndex == 3 ? AppColors.themeColor : Colors.grey,
//             ),
//
//             label: 'Done',
//           ),
//         ],
//       ),
//     );
//   }
// }
