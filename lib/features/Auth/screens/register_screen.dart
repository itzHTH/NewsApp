import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/extensions/route_extension.dart';
import 'package:news/core/theme/app_text_styles.dart';
import 'package:news/core/widgets/custom_text_form_field.dart';
import 'package:news/features/Auth/widgets/auth_bottom_row.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/auth-background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset('assets/images/app-logo.png', height: 45.h),
              ),
              SizedBox(height: 24.h),
              Text(
                'Welcome to Newts',
                style: AppTextStyles.textSecondaryBold20,
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                title: 'Email',
                hint: 'usama@gmail.com',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
                scrollPadding: EdgeInsets.zero,
              ),
              SizedBox(height: 12.h),
              CustomTextFormField(
                title: 'Password',
                hint: 'Enter your password',
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12.h),
              CustomTextFormField(
                title: 'Confirm Password',
                hint: 'Confirm your password',
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Confirm password is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.h),
              ElevatedButton(onPressed: () {}, child: Text('Sign Up')),
              SizedBox(height: 24.h),
              AuthBottomRow(
                text: 'Already have an account?',
                buttonText: 'Sign In',
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
