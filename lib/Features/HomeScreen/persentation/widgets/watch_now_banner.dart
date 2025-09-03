import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Models/MoviesResponse.dart';
import '../../../../Core/Theme/app_colors.dart';

class WatchNowBanner extends StatelessWidget {
  final Movies? movie;

  const WatchNowBanner({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    if (movie == null) return SizedBox.shrink();

    final image = movie!.largeCoverImage ?? movie!.mediumCoverImage ?? "";

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Stack(
          children: [
            Container(
              height: 180.h,
              width: double.infinity,
              child: image.isNotEmpty
                  ? Image.network(image, fit: BoxFit.cover)
                  : Image.asset(
                      "assets/images/no image.png",
                      fit: BoxFit.cover,
                    ),
            ),
            Positioned(
              left: 16,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie!.title ?? "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.getAccentColor(),
                    ),
                    onPressed: () {
                      // TODO: navigate to details
                    },
                    icon: Icon(Icons.play_arrow),
                    label: Text("Watch Now"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
