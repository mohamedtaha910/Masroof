import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/widgets/custom_button.dart';
import 'package:masroof/core/widgets/custom_glass.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/amount_text_feild.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/custom_type.dart';

class TransactionAmountAndType extends StatefulWidget {
  const TransactionAmountAndType({
    super.key,
    required this.onAmountSelected,
    required this.onTypeSelected,
  });

  final ValueChanged<String> onAmountSelected;
  final ValueChanged<TransactionType> onTypeSelected;

  @override
  State<TransactionAmountAndType> createState() =>
      _TransactionAmountAndTypeState();
}

class _TransactionAmountAndTypeState extends State<TransactionAmountAndType> {
  TransactionType type = TransactionType.income;

  @override
  Widget build(BuildContext context) {
    return CustomGlass(
      radius: 14,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        color: Colors.white.withAlpha(120),
        child: Column(
          children: [
            Text(
              'ENTER AMOUNT',
              style: TextStyle(color: Colors.black54, fontSize: 12.sp),
            ),

            SizedBox(height: 16.h),
            AmountTextFeild(
              onChanged: (value) {
                widget.onAmountSelected(value);
              },
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    colors: type == TransactionType.income
                        ? [
                            AppColors.primaryColor.withAlpha(200),
                            AppColors.primaryColor.withAlpha(200),
                          ]
                        : [AppColors.neutralColor, AppColors.neutralColor],
                    borderRadius: 12,
                    horizontalPadding: 16,
                    verticalPadding: 8,
                    border: Border.all(color: Colors.grey.shade300),
                    onTap: () {
                      setState(() {
                        type = TransactionType.income;
                        widget.onTypeSelected(type);
                      });
                    },
                    child: CustomType(
                      type: type,
                      color: AppColors.incomeColor,
                      icon: 'assets/icons/income.svg',
                      text: 'Income',
                      isSelected: type == TransactionType.income,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: CustomButton(
                    colors: type == TransactionType.expense
                        ? [
                            AppColors.primaryColor.withAlpha(200),
                            AppColors.primaryColor.withAlpha(200),
                          ]
                        : [AppColors.neutralColor, AppColors.neutralColor],
                    borderRadius: 12,
                    horizontalPadding: 16,
                    verticalPadding: 8,
                    border: Border.all(color: Colors.grey.shade300),
                    onTap: () {
                      setState(() {
                        type = TransactionType.expense;
                        widget.onTypeSelected(type);
                      });
                    },
                    child: CustomType(
                      type: type,
                      color: AppColors.expenseColor,
                      icon: 'assets/icons/expense.svg',
                      text: 'Expense',
                      isSelected: type == TransactionType.expense,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
