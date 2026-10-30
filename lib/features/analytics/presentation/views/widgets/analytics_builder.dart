import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/features/analytics/domain/entities/analytics_entity.dart';
import 'package:masroof/features/analytics/presentation/manager/analytics_cubit/analytics_cubit.dart';
import 'package:masroof/features/analytics/presentation/manager/analytics_cubit/analytics_state.dart';
import 'package:masroof/features/analytics/presentation/views/widgets/analytics_body.dart';
import 'package:masroof/features/auth/presentation/views/widgets/custom_loading_indicator.dart';

class AnalyticsBuilder extends StatelessWidget {
  const AnalyticsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyticsCubit, AnalyticsState>(
      builder: (context, state) {
        if (state is AnalyticsInitial || state is AnalyticsLoading) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 160.h),
              Center(child: CustomLoadingIndicator()),
            ],
          );
        } else if (state is AnalyticsSuccess) {
          AnalyticsEntity analyticsEntity = state.analytics;
          return AnalyticsBody(analyticsEntity: analyticsEntity);
        } else {
          return Center(child: Text('errpr'));
        }
      },
    );
  }
}
