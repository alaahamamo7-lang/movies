import 'package:flutter/material.dart';
import 'package:movies/features/home/models/nav_bar_item_model.dart';
import 'package:movies/features/home/tabs/explore_tab/ui/screen/explore_tab.dart';
import 'package:movies/features/home/tabs/home_tab/ui/home_tab.dart';
import 'package:movies/features/home/tabs/profile_tab/ui/screen/profile_tab.dart';
import 'package:movies/features/home/tabs/screach_tab/ui/screen/search_tab.dart';

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
            // items: [
            // //   BottomNavigationBarItem(
            // //     icon: NavBarItem(
            // //       iconName: AppAssets.svgHouse,
            // //       iconColor: theme.colorScheme.onSurfaceVariant,
            // //     ),
            // //     activeIcon: NavBarItem(
            // //       iconName: AppAssets.svgHouse,
            // //       iconColor: theme.colorScheme.primary,
            // //     ),
            // //     label: "Home",
            // //   ),
            // //   BottomNavigationBarItem(
            // //     icon: NavBarItem(
            // //       iconName: AppAssets.svgSearch,
            // //       iconColor: theme.colorScheme.onSurfaceVariant,
            // //     ),
            // //     activeIcon: NavBarItem(
            // //       iconName: AppAssets.svgSearch,
            // //       iconColor: theme.colorScheme.primary,
            // //     ),
            // //     label: "Search",
            // //   ),
            // //   BottomNavigationBarItem(
            // //     icon: NavBarItem(
            // //       iconName: AppAssets.svgExplore,
            // //       iconColor: theme.colorScheme.onSurfaceVariant,
            // //     ),
            // //     activeIcon: NavBarItem(
            // //       iconName: AppAssets.svgExplore,
            // //       iconColor: theme.colorScheme.primary,
            // //     ),
            // //     label: "Explore",
            // //   ),
            // //   BottomNavigationBarItem(
            // //     icon: NavBarItem(
            // //       iconName: AppAssets.svgProfile,
            // //       iconColor: theme.colorScheme.onSurfaceVariant,
            // //     ),
            // //     activeIcon: NavBarItem(
            // //       iconName: AppAssets.svgProfile,
            // //       iconColor: theme.colorScheme.primary,
            // //     ),
            // //     label: "Profile",
            // //   ),
            // ],
          ),
        ),
      ),
    );
  }
}
