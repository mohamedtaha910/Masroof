import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masroof/core/utils/app_colors.dart';

class CustomShift extends StatelessWidget {
  const CustomShift({
    super.key,
    required this.destination,
    required this.text,
    required this.text2,
  });
  final Widget destination;
  final String text;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text2,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        // SizedBox(width: 4),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => destination),
            );
          },
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.tertiaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
