import 'package:flutter/material.dart';

import '../Theme/app_colors.dart';

class ButtomTabs extends StatefulWidget {
  const ButtomTabs({super.key});

  @override
  State<ButtomTabs> createState() => _ButtomTabsState();
}

class _ButtomTabsState extends State<ButtomTabs>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedTabIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {
        selectedTabIndex = tabController.index;
      });
    });
  }

  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.getBackgroundColor(),
      child: TabBar(
        dividerColor: AppColors.getBackgroundColor(),
        controller: tabController,
        indicatorColor: Colors.transparent,
        onTap: (index) {
          setState(() {
            selectedTabIndex = index;
          });
        },
        indicatorPadding: EdgeInsets.symmetric(horizontal: -50),

        tabs: [
          Tab(
            icon: Icon(
              Icons.home_filled,
              color: selectedTabIndex == 0
                  ? AppColors.getAccentColor()
                  : Colors.white,
              size: 35,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.search,
              color: selectedTabIndex == 1
                  ? AppColors.getAccentColor()
                  : Colors.white,
              size: 35,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.explore,
              color: selectedTabIndex == 2
                  ? AppColors.getAccentColor()
                  : Colors.white,
              size: 35,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.person,
              color: selectedTabIndex == 3
                  ? AppColors.getAccentColor()
                  : Colors.white,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
