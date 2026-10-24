import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/features/home/Presentation/views/widgets/header_badge.dart';
import 'package:masroof/features/home/domain/entities/home_summary_entity.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.summaryEntity});
  final HomeSummaryEntity summaryEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      height: 360.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(gradient: buildSmoothGradient()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 90.h),
          Text(
            'Total Balance ',
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white.withAlpha(200),
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            '£ ${summaryEntity.totalBalance}',
            style: TextStyle(fontSize: 38.sp, color: Colors.white),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Text(
                'Today (',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white.withAlpha(200),
                ),
              ),
              SizedBox(width: 6.w),
              SvgPicture.asset('assets/icons/income.svg', height: 8.h),
              SizedBox(width: 6.w),
              Text(
                '£ ${summaryEntity.todayIncome} ,',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white.withAlpha(200),
                ),
              ),

              SizedBox(width: 6.w),
              SvgPicture.asset('assets/icons/expense.svg', height: 8.h),
              SizedBox(width: 6.w),

              Text(
                '£ ${summaryEntity.todayExpense} ',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white.withAlpha(200),
                ),
              ),
              Text(
                ')',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white.withAlpha(200),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: HeaderBadge(
                  isIncome: true,
                  value: summaryEntity.totalIncome.toString(),
                ),
              ),
              SizedBox(width: 6.w),
              Expanded(
                child: HeaderBadge(
                  isIncome: false,
                  value: summaryEntity.totalExpense.toString(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  LinearGradient buildSmoothGradient() {
    const steps = 16;
    final colors = <Color>[];
    final stops = <double>[];

    for (var i = 0; i <= steps; i++) {
      final t = i / steps;
      final Color c;
      if (t < 0.5) {
        // secondary -> tertiary (first half)
        c = Color.lerp(
          AppColors.secondaryColor.withAlpha(235),
          AppColors.secondaryColor.withAlpha(205),
          Curves.easeInOut.transform(t * 2),
        )!;
      } else {
        // tertiary -> neutral (second half)
        c = Color.lerp(
          AppColors.secondaryColor.withAlpha(190),
          AppColors.neutralColor,
          Curves.easeInOut.transform((t - 0.5) * 2),
        )!;
      }
      colors.add(c);
      stops.add(t);
    }

    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: colors,
      stops: stops,
    );
  }
}
