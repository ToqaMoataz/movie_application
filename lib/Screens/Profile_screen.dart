import 'package:flutter/material.dart';
import 'package:movie_app/Core/Theme/app_colors.dart';
import 'package:movie_app/Core/assets/app_images.dart';

class ProfileScreen extends StatefulWidget {
  static const String routename = "Profilescreen";

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  int selectedTabIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              color: AppColors.getBackgroundColor(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 52, left: 24),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                AppImages.Profile_image,
                              ),
                              radius: 50,
                            ),
                            SizedBox(height: 15),
                            Text(
                              "John Safwat",
                              style: TextStyle(
                                color: AppColors.getPrimaryTextColor(),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Text(
                                "12",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.getPrimaryTextColor(),
                                ),
                              ),
                              SizedBox(height: 14),
                              Text(
                                "Wish List",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.getPrimaryTextColor(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            children: [
                              Text(
                                "10",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.getPrimaryTextColor(),
                                ),
                              ),
                              SizedBox(height: 14),
                              Text(
                                "History",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.getPrimaryTextColor(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.getAccentColor(),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    16,
                                  ),
                                ),
                              ),
                              child: const Text(
                                "Edit Profile",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.getActionColor(),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: const Text(
                                "Exit",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),
                  TabBar(
                    dividerColor: AppColors.getBackgroundColor(),
                    controller: _tabController,
                    indicatorColor: AppColors.getAccentColor(),
                    indicatorPadding: EdgeInsets.symmetric(horizontal: -50),

                    tabs: [
                      Tab(
                        icon: Icon(
                          Icons.list,
                          color: AppColors.getAccentColor(),
                          size: 35,
                        ),
                        child: Text(
                          "Watch List",
                          style: TextStyle(
                            color: AppColors.getPrimaryTextColor(),
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.folder,
                          color: AppColors.getAccentColor(),
                          size: 35,
                        ),
                        child: Text(
                          "History",
                          style: TextStyle(
                            color: AppColors.getPrimaryTextColor(),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                controller: _tabController,

                children: [
                  Center(child: Image(image: AssetImage(AppImages.popcorn))),
                  Center(child: Image(image: AssetImage(AppImages.popcorn))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
