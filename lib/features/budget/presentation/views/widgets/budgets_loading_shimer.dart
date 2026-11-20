import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/widgets/custom_button.dart';
import 'package:masroof/features/auth/presentation/views/widgets/custom_loading_indicator.dart';
import 'package:shimmer/shimmer.dart';

class BudgetsLoadingShimer extends StatelessWidget {
  const BudgetsLoadingShimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 12.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 85.h),
            Shimmer.fromColors(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'LEFT TO SPEND',
                              style: TextStyle(
                                fontSize: 11.sp,
                                // fontWeight: FontWeight.w700,
                                color: AppColors.mutedColor,
                                // color: textColor,
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              '£ 0,000.0',
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                                // color: textColor,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.all(26.w),
                          decoration: BoxDecoration(
                            color: AppColors.neutralColor,
                            borderRadius: BorderRadius.circular(100),
                            // border: Border.all(color: AppColors.mutedColor.withAlpha(30)),
                            border: Border.all(color: Colors.white),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16.h),
                    LinearProgressIndicator(
                      value: 0.64,
                      // backgroundColor: AppColors.incomeColor.withAlpha(40),
                      backgroundColor: AppColors.mutedColor.withAlpha(50),
                      valueColor: AlwaysStoppedAnimation(
                        AppColors.expenseColor.withAlpha(180),
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                      minHeight: 5.h,
                    ),

                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Text(
                          '£ 0,000.0 OF £ 0,000.0',
                          style: TextStyle(
                            fontSize: 11.sp,
                            // fontWeight: FontWeight.w700,
                            color: AppColors.mutedColor,
                            // color: textColor,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '0.0% USED',
                          style: TextStyle(
                            fontSize: 11.sp,
                            // fontWeight: FontWeight.w700,
                            color: AppColors.expenseColor.withAlpha(180),
                            // color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.h),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(0),
              itemCount: 15,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0.h),
                  child: Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: AppColors.neutralColor.withAlpha(100),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
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
                            padding: EdgeInsets.all(22.r),
                            decoration: BoxDecoration(
                              color: AppColors.neutralColor,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(120.r),
                            ),
                            // child: Image.asset(category.iconPath, height: 22.h),
                          ),
                          SizedBox(width: 7.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 9.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(120.r),
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Container(
                                  height: 9.h,
                                  width: 65.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(120.r),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomButton(
                            borderRadius: 8,
                            colors: [
                              AppColors.primaryColor.withAlpha(180),
                              AppColors.primaryColor.withAlpha(220),
                            ],
                            horizontalPadding: 16,
                            verticalPadding: 4,
                            onTap: () {},
                            child: Text(
                              'Set',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //  Row(
                      //   children: [
                      //     Container(
                      //       padding: EdgeInsets.all(16.h),
                      //       decoration: BoxDecoration(
                      //         // color: const Color.fromARGB(255, 152, 185, 191),
                      //         color: AppColors.neutralColor,
                      //         shape: BoxShape.circle,
                      //         // borderRadius: BorderRadius.circular(10),
                      //         border: Border.all(
                      //           color: Colors.grey.shade300.withAlpha(200),
                      //           width: 0.8.w,
                      //         ),
                      //       ),
                      //       // child: Icon(Iconsax.shopping_cart, size: 18.h, color: Colors.white),
                      //       child:
                      //           // 'assets/category_icons/transport.png',
                      //           Icon(Icons.category_rounded, size: 22.h),

                      //       // 'assets/category_icons/work.png',
                      //     ),
                      //     SizedBox(width: 8.w),
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Container(
                      //           height: 15,
                      //           width: 140,
                      //           decoration: BoxDecoration(
                      //             color: Colors.white,
                      //             borderRadius: BorderRadius.circular(100),
                      //           ),
                      //         ),
                      //         SizedBox(height: 10.h),
                      //         Row(
                      //           children: [
                      //             Container(
                      //               height: 12,
                      //               width: 80,
                      //               decoration: BoxDecoration(
                      //                 color: Colors.white,
                      //                 borderRadius: BorderRadius.circular(100),
                      //               ),
                      //             ),
                      //             SizedBox(width: 12.w),

                      //             Container(
                      //               height: 12,
                      //               width: 50,
                      //               decoration: BoxDecoration(
                      //                 color: Colors.white,
                      //                 borderRadius: BorderRadius.circular(100),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ],
                      //     ),
                      //     Spacer(),
                      //     Text('000.0 £', style: TextStyle(fontSize: 13.sp)),
                      //   ],
                      // ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
    ;
  }
}
