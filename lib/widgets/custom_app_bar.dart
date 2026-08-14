import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/app_colors.dart';
import '../providers/app_auth_provider.dart';
import '../screens/login_screen.dart';

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
        GestureDetector(
          onTap: () async {
            await context.read<AppAuthProvider>().signOut();

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => LoginScreen()),
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
