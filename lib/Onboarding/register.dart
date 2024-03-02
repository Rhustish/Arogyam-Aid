import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: 812.h,
      width: 375.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60.0.h),
            child: Center(
              child: Text(
                "Hold on new friend ;)",
                style: GoogleFonts.lato(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          SizedBox(height: 30.w),
               SizedBox(
                width: 276.w,
                height: 16.w,
                child: Text(
                  "Full Name",
                  style: GoogleFonts.lato(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10.w),
              Container(
                width: 276.w,
                height: 56.w,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const TextField(
                  // controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration:InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10.0, top: 8.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
                 SizedBox(height: 30.w),
               SizedBox(
                width: 276.w,
                height: 16.w,
                child: Text(
                  "Age",
                  style: GoogleFonts.lato(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10.w),
              Container(
                width: 276.w,
                height: 56.w,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const TextField(
                  // controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10.0, top: 8.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
                 SizedBox(height: 30.w),
               SizedBox(
                width: 276.w,
                height: 16.w,
                child: Text(
                  "Gender",
                  style: GoogleFonts.lato(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10.w),
              Container(
                width: 276.w,
                height: 56.w,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const TextField(
                  // controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10.0, top: 8.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
                 SizedBox(height: 30.w),
               SizedBox(
                width: 276.w,
                height: 16.w,
                child: Text(
                  "Email ID",
                  style: GoogleFonts.lato(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10.w),
              Container(
                width: 276.w,
                height: 56.w,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const TextField(
                  // controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10.0, top: 8.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
               SizedBox(height: 30.w),
           
              
               const Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom:50.0.h),
                child: SizedBox(
                  width: 311.w,
                  height: 64.w,
                  child: ElevatedButton(
                    onPressed: () async{
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register(),)
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Next',
                      style: GoogleFonts.lato(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
        ],
      ),
    ));
  }
}
