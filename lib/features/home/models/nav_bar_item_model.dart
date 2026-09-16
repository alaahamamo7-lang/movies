import 'package:movies/core/constants/app_assets.dart';
import 'package:movies/features/home/widgets/active_nav_bar_item.dart';
import 'package:movies/features/home/widgets/nav_bar_item.dart';

class NavBarItemModel {
  ActiveNavBarItem active;
  NavBarItem inactive;

  String label;
  NavBarItemModel({
    required this.inactive,
    required this.active,
    required this.label,
  });
  static List<NavBarItemModel> navBarItems = [
    NavBarItemModel(
      inactive: NavBarItem(iconName: AppAssets.svgHouse),
      active: ActiveNavBarItem(iconName: AppAssets.svgHouse),
      label: "Home",
    ),
    NavBarItemModel(
      inactive: NavBarItem(iconName: AppAssets.svgSearch),
      active: ActiveNavBarItem(iconName: AppAssets.svgSearch),
      label: "Search",
    ),
    NavBarItemModel(
      inactive: NavBarItem(iconName: AppAssets.svgExplore),
      active: ActiveNavBarItem(iconName: AppAssets.svgExplore),
      label: "Explore",
    ),
    NavBarItemModel(
      inactive: NavBarItem(iconName: AppAssets.svgProfile),
      active: ActiveNavBarItem(iconName: AppAssets.svgProfile),
      label: "Profile",
    ),
  ];
}
