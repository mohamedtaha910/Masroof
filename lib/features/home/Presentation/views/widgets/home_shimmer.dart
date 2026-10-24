import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/features/home/Presentation/views/widgets/home_header.dart';
import 'package:masroof/features/home/domain/entities/home_summary_entity.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          HomeHeader(
            summaryEntity: HomeSummaryEntity(
              totalBalance: 0.000,
              totalIncome: 0.000,
              totalExpense: 0.000,
              todayIncome: 0.000,
              todayExpense: 0.000,
              recentTransactions: [],
            ),
          ),
          Transform.translate(
            offset: Offset(0, -32.h),
            child: Padding(
              padding: EdgeInsets.only(right: 14.w, left: 14.w, bottom: 50.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Recent transaction', style: TextStyle(fontSize: 14.sp)),

                  RecentTransactionShimmer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecentTransactionShimmer extends StatelessWidget {
  const RecentTransactionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 0),
        itemCount: 15,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h),
            child: Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: AppColors.neutralColor.withAlpha(100),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withAlpha(150),
                      Colors.white.withAlpha(150),
                    ],
                  ),
                  border: Border.all(color: Colors.white, width: 1.w),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.h),
                      decoration: BoxDecoration(
                        // color: const Color.fromARGB(255, 152, 185, 191),
                        color: AppColors.neutralColor,
                        shape: BoxShape.circle,
                        // borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.shade300.withAlpha(200),
                          width: 0.8.w,
                        ),
                      ),
                      // child: Icon(Iconsax.shopping_cart, size: 18.h, color: Colors.white),
                      child:
                          // 'assets/category_icons/transport.png',
                          Icon(Icons.category_rounded, size: 22.h),

                      // 'assets/category_icons/work.png',
                    ),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 15,
                          width: 140,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Container(
                              height: 12,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            SizedBox(width: 12.w),

                            Container(
                              height: 12,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Text('000.0 £', style: TextStyle(fontSize: 13.sp)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
