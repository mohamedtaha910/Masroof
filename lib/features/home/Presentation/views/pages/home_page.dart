import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/widgets/custom_blur.dart';
import 'package:masroof/features/auth/domain/entities/user_entity.dart';
import 'package:masroof/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:masroof/features/home/Presentation/manager/home_cubit/home_cubit.dart';
import 'package:masroof/features/home/Presentation/views/widgets/home_app_bar.dart';
import 'package:masroof/features/home/Presentation/views/widgets/home_header.dart';
import 'package:masroof/features/home/Presentation/views/widgets/home_shimmer.dart';
import 'package:masroof/features/home/Presentation/views/widgets/recent_transaction.dart';
import 'package:masroof/features/home/domain/entities/home_summary_entity.dart';
import 'package:masroof/features/transaction/presentation/manager/transaction_cubit/transaction_cubit.dart';
import 'package:masroof/features/transaction/presentation/manager/transaction_cubit/transaction_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('MediaQuery size: ${MediaQuery.sizeOf(context)}');
    debugPrint('ScreenUtil size: ${ScreenUtilPlus().screenWidth}');
    UserEntity? user = BlocProvider.of<AuthCubit>(context).getCurrentUser();
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: HomeAppBar(name: user?.displayName),
      ),
      body:
          //  Stack(
          // children: [
          BlocListener<TransactionsCubit, TransactionsState>(
            listener: (context, state) {
              if (state is TransactionAdded ||
                  state is TransactionDeleted ||
                  state is TransactionUpdated) {
                context.read<HomeCubit>().getHomeSummary();
              }
            },
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  // return Center(child: CustomLoadingIndicator());
                  return HomeShimmer();
                } else if (state is HomeSuccess) {
                  HomeSummaryEntity summaryEntity = state.summaryEntity;
                  return SingleChildScrollView(
                    // physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HomeHeader(summaryEntity: summaryEntity),
                        Transform.translate(
                          offset: Offset(0, -32.h),
                          child: RecentTransaction(
                            recentTransaction: summaryEntity.recentTransactions,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(child: Text('error'));
                }
              },
            ),
          ),

      // CustomBlur(
      //   sigmaX: 1.3,
      //   sigmay: 1.3,
      //   radius: 0,
      //   child: Container(
      //     height: 45.h,
      //     width: MediaQuery.of(context).size.width,
      //     decoration: BoxDecoration(
      //       // color: Colors.red,
      //       gradient: LinearGradient(
      //         colors: [
      //           // Colors.white.withAlpha(225),
      //           AppColors.secondaryColor.withAlpha(230),
      //           AppColors.secondaryColor.withAlpha(190),
      //           AppColors.secondaryColor.withAlpha(120),
      //           AppColors.secondaryColor.withAlpha(60),
      //           AppColors.secondaryColor.withAlpha(10),
      //           AppColors.secondaryColor.withAlpha(0),
      //         ],
      //         begin: AlignmentGeometry.topCenter,
      //         end: AlignmentGeometry.bottomCenter,
      //       ),
      //     ),
      //   ),
      // ),
      // ],
      // ),
    );
  }
}
