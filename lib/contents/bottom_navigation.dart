import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
class BottomNavigation extends StatelessWidget {
  final Function(int index) onPressed;
  const BottomNavigation({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5,bottom: 3),
      child: GNav(
        rippleColor: Colors.grey[100]!,
        hoverColor: Colors.grey[100]!,
        haptic: true,
        tabBorderRadius: 15,
        tabActiveBorder: Border.all(color: Colors.black,
        width: 1),
        tabBorder: Border.all(
          color: Colors.grey,
          width: 1
        ),
        tabShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.25),
          blurRadius: 13,)
        ],
        curve: Curves.easeInToLinear,
        duration: Duration(milliseconds: 419),
        gap: 8,
        color: Colors.grey[800],
        activeColor: Colors.purple,
        iconSize: 24,
        tabBackgroundColor: Colors.purple.withOpacity(0.1),
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        tabs: [
          GButton(icon: Icons.home,text: "Home",),
          GButton(icon: Icons.videocam,text: "Shorts",),
          GButton(icon: Icons.cloud_upload,),
          GButton(icon: Icons.search,text: "Search",),
          GButton(icon: Icons.heart_broken,text: "Log Out",),
        ],
        onTabChange: onPressed,
      ),
    );
  }
}