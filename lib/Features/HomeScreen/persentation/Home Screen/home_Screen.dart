import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Features/HomeScreen/domain/user%20repository/user_repo.dart';
import '../../domain/movie repository/movie_remote_repo_imp.dart';
import '../HomeScreen cubit/cubit.dart';
import '../HomeScreen cubit/state.dart';
import 'Tabs/Browse Tab/browse_tab.dart';
import 'Tabs/Home Tab/home_tab.dart';
import 'Tabs/Profile Tab/profile_tab.dart';
import 'Tabs/Search Tab/search_tab.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName="homeScreen";
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context)=>HomeCubit(MoviesRemoteRepository(),UserRepoImp()),
      child:BlocConsumer<HomeCubit,HomeStates>(
          builder: (context,state){
            return  Scaffold(
              body: returnTab(HomeCubit.get(context).state.currTabIndex),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: BottomNavigationBar(
                    currentIndex: HomeCubit.get(context).state.currTabIndex,
                    onTap: (value){
                      HomeCubit.get(context).setTabIndex(value);
                      print("Current Tab Index:${HomeCubit.get(context).state.currTabIndex}");
                    },
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home_filled),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.search_rounded),
                        label: 'Search',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.explore),
                        label: 'Explore',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Profile',
                      ),
                    ],
                  ),
                ),
              ),

            );
          },
          listener: (context,state){}
      ),
    );
  }
  Widget returnTab(int index){
    if(index==0){
      return HomeTab();
    }
    else if(index==1){
      return SearchTab();
    }
    else if(index==2){
      return BrowseTab();
    }
    return ProfileTab();
  }
}
