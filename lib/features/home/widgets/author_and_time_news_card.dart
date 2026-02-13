import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/theme/app_text_styles.dart';
import 'package:news/core/widgets/custom_cached_network_image.dart';

class AuthorAndTimeNewsCard extends StatelessWidget {
  const AuthorAndTimeNewsCard({
    super.key,
    required this.authorName,
    required this.time,
    required this.image,
  });

  final String authorName;
  final String time;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: CustomCachedNetworkImage(
            imageUrl: image,
            height: 20.h,
            width: 20.w,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            authorName,
            style: AppTextStyles.whiteRegular14,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 8.w),
        Text(time, style: AppTextStyles.whiteRegular14),
      ],
    );
  }
}
