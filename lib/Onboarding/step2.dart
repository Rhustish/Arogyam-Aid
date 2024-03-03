import 'package:Arogyam/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Step2 extends StatefulWidget {
  final String fullName;
  final String age;
  final String gender;
  final String email;
  final String phone;

  const Step2({
    Key? key,
    required this.fullName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
  }) : super(key: key);

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postalController = TextEditingController();
  final supabase = Supabase.instance.client;
  Future<void> onSubmit() async {
    final response = await supabase.from('users').insert([
      {
        'full_name': widget.fullName,
        'age': widget.age,
        'gender': widget.gender,
        'email': widget.email,
        'phone': widget.phone,
        'address': addressController.text,
        'country': countryController.text,
        'city': cityController.text,
        'postal_code': postalController.text,
      }
    ]);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Profile(phone:widget.phone)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setting you up !',
          style: GoogleFonts.lato(
            fontSize: 16.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 812.h,
          width: 375.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10.w),
              SizedBox(
                width: 276.w,
                height: 16.w,
                child: Text(
                  "Address",
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
                  controller: addressController,
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
                  "Country",
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
                  controller: countryController,
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
                  "City",
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
                  controller: cityController,
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
                  "Postal Code",
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
                  controller: postalController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10.0, top: 8.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 30.w),
              Text(
                "Don’t worry , Your information is secure with us .",
                style: GoogleFonts.lato(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 150.0.h),
                child: SizedBox(
                  width: 311.w,
                  height: 64.w,
                  child: SlideAction(
                    borderRadius: 10,
                    elevation: 1,
                    innerColor: Colors.white,
                    outerColor: Colors.black,
                    sliderButtonIcon: const Icon(
                      Icons.check,
                      color: Colors.black,
                    ),
                    text: "Register",
                    textStyle: GoogleFonts.openSans(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    onSubmit: () {
                      onSubmit();
                    },
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
