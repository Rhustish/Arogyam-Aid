import 'package:Arogyam/Onboarding/step2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_to_act/slide_to_act.dart';

class Step1 extends StatefulWidget {
  final String phone;

  const Step1({Key? key, required this.phone}) : super(key: key);

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 812.h,
          width: 375.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.0.h),
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
                  child:  TextField( 
                    controller: fullNameController,
                    keyboardType: TextInputType.text, 
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
                  child: TextField( 
                    controller: ageController,
                    keyboardType: TextInputType.text, 
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
                  child: TextField( 
                    controller: genderController, 
                    keyboardType: TextInputType.text, 
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
                  child: TextField( 
                    controller: emailController, 
                    keyboardType: TextInputType.text, 
                    decoration: InputDecoration( 
                      contentPadding: EdgeInsets.only(left: 10.0, top: 8.0), 
                      border: InputBorder.none, 
                    ), 
                  ), 
                ), 
                SizedBox(height: 20.w),
                Text(
                  "Just a few more questions to go...",
                  style: GoogleFonts.lato(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                  ),
                ),
              const Spacer(),
        
              Padding(
                padding: EdgeInsets.only(bottom: 60.0.h),
                child: SizedBox(
                  width: 311.w,
                  height: 64.w,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Step2(
                            fullName: fullNameController.text,
                            age: ageController.text,
                            gender: genderController.text,
                            email: emailController.text,
                            phone:widget.phone
                          ),
                        ),
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
        ),
      ),
    );
  }
}