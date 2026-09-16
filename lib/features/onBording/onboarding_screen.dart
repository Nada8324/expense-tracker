import 'package:expense_tracker/features/register/presentaion/cubit/register_cubit.dart';
import 'package:expense_tracker/features/register/presentaion/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: .start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60.r),
              bottomRight: Radius.circular(60.r),
              topLeft: Radius.circular(30),
            ),
            child: Image.asset(
              "assets/images/image.png",
              width: .infinity,
              height: 389,
              fit: BoxFit.cover,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(30.r),
            child: Column(
              crossAxisAlignment: .start,
              spacing: 32.h,
              children: [
                Text(
                  "Simple solution for your budget.",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: .bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Counter and distribute the income correctly...",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => RegisterCubit(),
                          child: RegisterScreen(),
                        ),
                      ),
                    );
                  },
                  child: Center(
                    child: Container(
                      alignment: .center,
                      height: 42.h,
                      width: 194.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            spreadRadius: 0,
                            color: Color(0x1D000000),
                          ),
                        ],
                      ),
                      child: Text(
                        "Continue",
                        style: TextStyle(color: Colors.white, fontSize: 15.sp),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
