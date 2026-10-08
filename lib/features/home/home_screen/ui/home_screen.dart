import 'package:flutter/material.dart';
import 'package:movies/features/home/home_screen/models/nav_bar_item_model.dart';
import 'package:movies/features/home/presentation/screens/explore_tab/explore_tab.dart';
import 'package:movies/features/home/presentation/screens/home_tab/home_tab.dart';
import 'package:movies/features/home/presentation/screens/profile_tab/profile_tab.dart';
import 'package:movies/features/home/presentation/screens/search_tab/search_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [HomeTab(), SearchTab(), ExploreTab(), ProfileTab()];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: tabs[currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),

        child: ClipRRect(
          clipBehavior: .antiAlias,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            items: NavBarItemModel.navBarItems
                .map(
                  (navBarItem) => BottomNavigationBarItem(
                    icon: navBarItem.inactive,
                    activeIcon: navBarItem.active,
                    label: navBarItem.label,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
