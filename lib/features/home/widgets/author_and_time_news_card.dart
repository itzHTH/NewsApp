import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/theme/app_text_styles.dart';

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
        CircleAvatar(radius: 10.r, backgroundImage: AssetImage(image)),
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
