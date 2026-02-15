import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/core/theme/app_text_styles.dart';
import 'package:news/core/widgets/custom_cached_network_image.dart';

class AuthorAndTimeNewsCard extends StatefulWidget {
  const AuthorAndTimeNewsCard({
    super.key,
    required this.authorName,
    required this.time,
    required this.image,
    this.isDark = false,
    this.hasBookmark = false,
  });

  final String authorName;
  final String time;
  final String image;
  final bool isDark;
  final bool hasBookmark;

  @override
  State<AuthorAndTimeNewsCard> createState() => _AuthorAndTimeNewsCardState();
}

class _AuthorAndTimeNewsCardState extends State<AuthorAndTimeNewsCard> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Author Image
        ClipRRect(
          borderRadius: BorderRadius.circular(30.r),
          child: CustomCachedNetworkImage(
            imageUrl: widget.image,
            height: 24.h,
            width: 24.w,
          ),
        ),
        SizedBox(width: 8.w),
        // Author Name
        Expanded(
          child: Text(
            widget.authorName,
            style: !widget.isDark
                ? AppTextStyles.whiteRegular14
                : AppTextStyles.textPrimaryRegular14,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 8.w),
        // Time
        Text(
          widget.time,
          style: !widget.isDark
              ? AppTextStyles.whiteRegular14
              : AppTextStyles.textPrimaryRegular14,
        ),
        // Bookmark Icon
        SizedBox(width: widget.hasBookmark ? 16.w : 0.w),
        if (widget.hasBookmark)
          InkWell(
            borderRadius: BorderRadius.circular(10.r),
            splashColor: AppColors.textSecondaryColor.withValues(alpha: 0.3),
            splashFactory: InkSplash.splashFactory,
            highlightColor: AppColors.textSecondaryColor.withValues(alpha: 0.3),

            onTap: () {
              setState(() {
                isBookmarked = !isBookmarked;
              });
            },
            child: Icon(
              isBookmarked
                  ? Icons.bookmark_outlined
                  : Icons.bookmark_border_outlined,
              size: 25,
              color: !isBookmarked
                  ? AppColors.textSecondaryColor
                  : AppColors.primaryColor,
            ),
          ),
      ],
    );
  }
}
