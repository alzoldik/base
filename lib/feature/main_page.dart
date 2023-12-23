import 'package:flutter/material.dart';
import '../widgets/app_bottom_nav.dart';
import 'home/view/home_view.dart';
import 'notification/view/notification_view.dart';
import 'profile/view/profile_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
    this.index = 0,
  });
  final int index;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int _currentIndex;

  Widget _fregmaint(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const NotificationView();
      case 2:
        return const ProfileView();
      default:
        return const HomeView();
    }
  }

  @override
  void initState() {
    _currentIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _fregmaint(_currentIndex),
      bottomNavigationBar: AppBottomNav(
        currentIdex: _currentIndex,
        onTap: (p0) {
          setState(() => _currentIndex = p0);
        },
      ),
    );
  }
}
