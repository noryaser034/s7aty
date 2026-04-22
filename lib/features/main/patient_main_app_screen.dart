import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:se7ety/core/styles/app_colors.dart';
import 'package:se7ety/features/home/presentation/screens/patient_home_screen.dart';

class PatientMainAppScreen extends StatefulWidget {
  const PatientMainAppScreen({super.key, this.initialIndex = 0});
  final int initialIndex;
  @override
  State<PatientMainAppScreen> createState() => _PatientMainAppScreenState();
}

class _PatientMainAppScreenState extends State<PatientMainAppScreen> {
  late int selectedIndex;
  @override
  void initState() {
    selectedIndex = widget.initialIndex;
    super.initState();
  }

  List<Widget> screens = [
    const PatientHomeScreen(),
    Container(color: Colors.green),
    Container(color: Colors.blue),
    Container(color: Colors.yellow),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withValues(alpha: .5),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: GNav(
            gap: 5,
            iconSize: 22,
            onTabChange: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            tabs: [
              GButton(
                icon: Icons.home,
                text: "الرئيسية",
                backgroundColor: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(15),
                iconActiveColor: AppColors.bgColor,
                textColor: AppColors.bgColor,
              ),
              GButton(
                icon: Icons.search,
                text: "البحث",
                backgroundColor: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(15),
                iconActiveColor: AppColors.bgColor,
                textColor: AppColors.bgColor,
              ),
              GButton(
                icon: Icons.calendar_today,
                text: "المواعيد",
                backgroundColor: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(15),
                iconActiveColor: AppColors.bgColor,
                textColor: AppColors.bgColor,
              ),
              GButton(
                icon: Icons.person,
                text: "الحساب",
                backgroundColor: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(15),
                iconActiveColor: AppColors.bgColor,
                textColor: AppColors.bgColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
