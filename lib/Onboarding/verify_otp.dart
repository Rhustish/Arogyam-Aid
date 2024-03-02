import 'package:Arogyam/Onboarding/Page1.dart';
import 'package:Arogyam/Onboarding/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VerifyOTP extends StatefulWidget {
  final String phone;

  const VerifyOTP({Key? key, required this.phone}) : super(key: key);

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  OtpFieldController otpController = OtpFieldController();
  late CountDownController _countDownController = CountDownController();
  bool isTimerCompleted = false;
  var otpToken = "";

  @override
  void initState() {
    super.initState();
    _countDownController = CountDownController();
    _startTimer();
  }

  void _startTimer() {
    _countDownController.restart(duration: 60);
    setState(() {
      isTimerCompleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Account'),
      ),
      body: SizedBox(
        height: 812.h,
        width: 375.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.0.h),
              child: CircularCountDownTimer(
                textFormat: CountdownTextFormat.MM_SS,
                duration: 60,
                controller: _countDownController,
                isReverse: true,
                width: 150.w,
                height: 150.w,
                ringColor: Color.fromRGBO(38, 60, 200, 100),
                strokeWidth: 10.w,
                fillColor: Colors.white,
                textStyle: TextStyle(fontSize: 20.sp),
                onComplete: () {
                  setState(() {
                    isTimerCompleted = true;
                  });
                },
              ),
            ),
            SizedBox(height: 50.w),
            SizedBox(
              width: 276.w,
              height: 16.w,
              child: Text(
                "OTP",
                style: GoogleFonts.lato(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 18.w),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0.w),
              child: OTPTextField(
                  controller: otpController,
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 45,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 15,
                  style: TextStyle(fontSize: 17),
                  onCompleted: (pin) {
                    setState(() {
                      otpToken = pin.toString();
                      print(otpToken);
                    });
                  }),
            ),
            if (!isTimerCompleted) SizedBox(height: 44.w),
            if (isTimerCompleted) SizedBox(height: 30.w),
            if (isTimerCompleted)
              SizedBox(
                width: 311.w,
                height: 14.w,
                child: ElevatedButton(
                  onPressed: () {
                    // Implement resend OTP functionality
                    _startTimer(); // Restart the timer
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.white, 
                    alignment: Alignment.centerRight, 
                    elevation: 0,
                  ),
                  child: Text(
                    'Resend OTP',
                    style: GoogleFonts.lato(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(38, 60, 200, 100),
                    ),
                  ),
                ),
              ),
            SizedBox(height: 30.w),
            Text(
              "Enter OTP we sent on ${widget.phone}",
              style: GoogleFonts.lato(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 80.0.h),
              child: SizedBox(
                width: 311.w,
                height: 64.w,
                child: ElevatedButton(
                  onPressed: () async {
                      await Supabase.instance.client.auth.verifyOTP(
                        phone: widget.phone,
                        token: otpToken,
                        type: OtpType.sms,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Register()),
                      );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Verify OTP',
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
    );
  }
}
