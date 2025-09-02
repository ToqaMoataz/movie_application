import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Core/Theme/app_colors.dart';
import '../../../HomeScreen cubit/cubit.dart';
import '../../../HomeScreen cubit/state.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileTab> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
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
        body: BlocBuilder<HomeCubit,HomeStates>(
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            var user=cubit.state.user;
            if (cubit.state.profileMoviesRequestState==RequestState.loading) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.getAccentColor(),
                ),
              );
            }
            else if (cubit.state.profileMoviesRequestState==RequestState.success) {
              if (user == null) {
                return Center(
                  child: Text(
                    "No User Signed In",
                    style: GoogleFonts.roboto(
                      fontSize: 24.sp,
                      color: AppColors.getAccentColor(),
                    ),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                children: [
                  Container(
                    color: AppColors.getBackgroundColor(),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage("assets/images/${user.image}.png"),
                                  radius: 50.r,
                                ),
                                SizedBox(height: 15.h),
                                Text(
                                  cubit.state.user!.name,
                                  style: GoogleFonts.roboto(
                                    color: AppColors.getPrimaryTextColor(),
                                    fontSize: 20.sp,
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
                                      (user.toWatchList==null) ? "0" : "${user.toWatchList?.length}" ,
                                      style: GoogleFonts.roboto(
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.getPrimaryTextColor(),
                                      ),
                                    ),
                                    SizedBox(height: 14),
                                    Text(
                                      "Wish List",
                                      style: GoogleFonts.roboto(
                                        fontSize: 24.sp,
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
                                    (user.historyList==null) ? "0" : "${user.historyList?.length}" ,
                                    style: GoogleFonts.roboto(
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.getPrimaryTextColor(),
                                    ),
                                  ),
                                  SizedBox(height: 14.h),
                                  Text(
                                    "History",
                                    style: GoogleFonts.roboto(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.getPrimaryTextColor(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                height: 50.h,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.getAccentColor(),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadiusGeometry.circular(16.r),
                                      ),
                                    ),
                                    child: Text(
                                      "Edit Profile",
                                      style: GoogleFonts.roboto(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
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
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Exit",
                                          style: GoogleFonts.roboto(
                                            color: AppColors.getPrimaryTextColor(),
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        Icon(Icons.logout_outlined,color: AppColors.getIconColor(),)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 10.h),
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
                                size: 35.sp,
                              ),
                              child: Text(
                                "Watch List",
                                style: GoogleFonts.roboto(
                                  color: AppColors.getPrimaryTextColor(),
                                  fontSize: 20.sp,
                                ),
                              ),
                            ),
                            Tab(
                              icon: Icon(
                                Icons.folder,
                                color: AppColors.getAccentColor(),
                                size: 35.sp,
                              ),
                              child: Text(
                                "History",
                                style: GoogleFonts.roboto(
                                  color: AppColors.getPrimaryTextColor(),
                                  fontSize: 20.sp,
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
                        Center(child: Image(image: AssetImage("assets/images/empty.png"))),
                        Center(child: Image(image: AssetImage("assets/images/empty.png"))),
                      ],
                    ),
                  ),
                ],
                            ),
              );
            }
            else if (cubit.state.profileMoviesRequestState==RequestState.error) {
              return Center(
                child: Text(
                  "Something went wrong",
                  style: GoogleFonts.roboto(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
