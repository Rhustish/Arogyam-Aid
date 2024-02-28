import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_to_act/slide_to_act.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final List<String> images = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 812.h,
        width: 375.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 343.w,
              height: 355.h,
              child: Expanded(
                child: PageView.builder(
                  itemCount: images.length,
                  controller: PageController(viewportFraction: 1.0),
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: SizedBox(
                        width: 343.w,
                        height: 355.h,
                        child: Center(
                          child: Image.asset(images[index]),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              width: 255.w,
              height: 48.w,
              child: Center(
                child: Text(
                  'Aarogyam Aid',
                  style: GoogleFonts.lato(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.w,
            ),
            Text(
              "Explore personalised",
              style: GoogleFonts.lato(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "insurance and government",
              style: GoogleFonts.lato(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "schemes..",
              style: GoogleFonts.lato(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 60.w,
            ),
            DotsIndicator(
              dotsCount: images.length,
              position: currentIndex.toDouble(),
              decorator: DotsDecorator(
                activeColor: const Color(0xff324fc5),
                size: const Size.square(8.0),
                activeSize: const Size(20.0, 8.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, top: 30),
              child: SizedBox(
                width: 311.w,
                height: 64.w,
                child: SlideAction(
                  borderRadius: 6,
                  elevation: 1,
                  innerColor: Colors.white,
                  outerColor: Colors.black,
                  sliderButtonIcon: const Icon(
                    Icons.check,
                    color: Colors.black,
                  ),
                  text: "Start Now",
                  textStyle: GoogleFonts.openSans(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  onSubmit: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Page1()),
                      (route) => false, // Remove all routes from the stack
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
