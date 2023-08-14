import 'package:base/utility/extintions.dart';
import 'package:flutter/material.dart';

import '../widgets/images.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String? title = ModalRoute.of(context)?.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ""),
        leading: IconButton(
          onPressed: () {},
          icon: Images(
            image: "assets/svgs/home/blue-requests.svg",
            height: 32.h,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Images(
              image: "assets/svgs/home/notification.svg",
              height: 32.h,
            ),
          ),
        ],
      ),
      body: const Center(child: Text("Main Page")),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: context.theme.primaryColor,
        selectedIconTheme: IconThemeData(color: context.theme.primaryColor),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedItemColor: context.theme.primaryColor,
        type: BottomNavigationBarType.fixed,
        mouseCursor: MouseCursor.defer,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        currentIndex: 0,
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
              image: "assets/svgs/home/person.svg",
              color: context.theme.primaryColor,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
