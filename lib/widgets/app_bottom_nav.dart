import 'package:base/utility/extintions.dart';
import 'package:base/widgets/images.dart';
import 'package:flutter/material.dart';

class AppBottomNav extends StatefulWidget {
  const AppBottomNav({
    super.key,
    this.onTap,
    this.currentIdex = 1,
  });
  final Function(int)? onTap;
  final int currentIdex;

  @override
  State<AppBottomNav> createState() => _AppBottomNavState();
}

class _AppBottomNavState extends State<AppBottomNav> {
  late int _currentIndex;

  @override
  void initState() {
    _currentIndex = widget.currentIdex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: context.theme.colorScheme.primary,
      unselectedItemColor: context.theme.dividerColor,
      selectedIconTheme: IconThemeData(color: context.theme.primaryColor),
      showUnselectedLabels: true,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      mouseCursor: MouseCursor.defer,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      currentIndex: _currentIndex,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      onTap: (value) {
        setState(() => _currentIndex = value);
        widget.onTap?.call(value);
      },
      items: [
        BottomNavigationBarItem(
          icon: Images(
            image: "assets/svgs/home/home.svg",
            color: context.theme.primaryColor,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Images(
            image: "assets/svgs/home/notification.svg",
            color: context.theme.primaryColor,
          ),
          label: "Notifications",
        ),
        BottomNavigationBarItem(
          icon: Images(
            image: "assets/svgs/home/person.svg",
            color: context.theme.primaryColor,
          ),
          label: "Profile",
        ),
      ],
    );
  }
}
