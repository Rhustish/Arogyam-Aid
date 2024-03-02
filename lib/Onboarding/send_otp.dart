import 'package:Arogyam/Onboarding/verify_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SendOTP extends StatefulWidget {
  const SendOTP({Key? key}) : super(key: key);
  @override
  State<SendOTP> createState() => _SendOTPState();
}

class _SendOTPState extends State<SendOTP> {
  final TextEditingController _phoneNumberController = TextEditingController();

  final String image = 'assets/phone.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 812.h,
        width: 375.w,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 100.0, horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Let's get you in",
                  style: GoogleFonts.lato(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(height: 50.w),
              SizedBox(
                width: 110.w,
                height: 170.w,
                child: Center(child: Image.asset(image)),
              ),
              SizedBox(height: 50.w),
              SizedBox(
                width: 276.w,
                height: 16.w,
                child: Text(
                  "Phone Number",
                  style: GoogleFonts.lato(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 18.w),
              Container(
                width: 276.w,
                height: 56.w,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10.0, top: 8.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 30.w),
              Text(
                "We will send you a one time password (OTP)",
                style: GoogleFonts.lato(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 311.w,
                height: 64.w,
                child: ElevatedButton(
                  onPressed: () async{
                    final phone = _phoneNumberController.text;                
                    final supabase = Supabase.instance.client;
                    supabase.auth.signInWithOtp(phone: phone);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VerifyOTP(phone:phone)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Send OTP',
                    style: GoogleFonts.lato(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
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
