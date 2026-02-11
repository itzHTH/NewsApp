import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/core/theme/app_text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.prefixIcon,
    required this.validator,
    this.textEditingController,
    this.verticalContentPadding = 0,
    this.isPassword,
    this.keyboardType,
    this.textInputAction,
    this.onFieldSubmitted,
    this.scrollPadding,
    required this.title,
  });

  final String hint;
  final String title;
  final String? prefixIcon;
  final double verticalContentPadding;
  final TextEditingController? textEditingController;
  final bool? isPassword;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String value)? onFieldSubmitted;
  final EdgeInsets? scrollPadding;
  final String? Function(String? value) validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isHide = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: AppTextStyles.textPrimaryRegular16),
        SizedBox(height: 8.h),
        TextFormField(
          style: AppTextStyles.textPrimaryRegular16,
          controller: widget.textEditingController,
          autocorrect: widget.isPassword ?? false,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: widget.onFieldSubmitted,
          validator: widget.validator,
          scrollPadding: widget.scrollPadding ?? EdgeInsets.all(20),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: widget.verticalContentPadding,
              horizontal: 10,
            ),
            hintText: widget.hint,
            suffixIcon: widget.isPassword ?? false
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isHide = !_isHide;
                      });
                    },
                    icon: Icon(
                      _isHide
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  )
                : null,
          ),
          obscureText: widget.isPassword ?? false ? _isHide : false,

          cursorColor: AppColors.primaryColor,
        ),
      ],
    );
  }
}
