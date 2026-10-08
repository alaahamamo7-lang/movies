import 'package:flutter/material.dart';
import 'package:movies/features/home/home_screen/models/category_model.dart';
import 'package:movies/features/home/presentation/widgets/tab_bar_item.dart';

class ExploreTab extends StatefulWidget {
  ExploreTab({super.key});

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: size.height * 0.01),
            DefaultTabController(
              length: CategoryModel.categories.length,
              child: TabBar(
                onTap: (index) {
                  if (currentIndex == index) return;
                  currentIndex = index;
                  setState(() {});
                },
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                tabAlignment: .start,
                labelPadding: EdgeInsets.only(right: 8),
                padding: EdgeInsets.only(left: 16),
                tabs: CategoryModel.categories
                    .map(
                      (category) => TabBarItem(
                        isSelected:
                            currentIndex ==
                            CategoryModel.categories.indexOf(category),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
