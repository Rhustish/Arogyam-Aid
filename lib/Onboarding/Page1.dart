// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 812.h,
        width: 375.w,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 343.w,
                height: 355.h,
                child: const Center(
                  child: Image(
                    image: AssetImage('assets/1.png'),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 255.w,
                  height: 48.w,
                  child: Text(
                    ' Aarogyam Aid',
                    style: GoogleFonts.lato(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
