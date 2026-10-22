import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/widgets/custom_button.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/custom_type.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/edit_amount_text_feild.dart';

class EditAmountAndType extends StatefulWidget {
  const EditAmountAndType({
    super.key,
    required this.onAmountChanged,
    required this.onTypeChanged,
    required this.transaction,
  });
  final TransactionEntity transaction;
  final ValueChanged<String> onAmountChanged;
  final ValueChanged<TransactionType> onTypeChanged;

  @override
  State<EditAmountAndType> createState() => _EditAmountAndTypeState();
}

class _EditAmountAndTypeState extends State<EditAmountAndType> {
  late TransactionType type;

  @override
  void initState() {
    super.initState();
    type = widget.transaction.type;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),

      decoration: BoxDecoration(
        color: Colors.white.withAlpha(130),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withAlpha(180)),
      ),
      child: Column(
        children: [
          Text(
            'ENTER AMOUNT',
            style: TextStyle(color: Colors.black54, fontSize: 12.sp),
          ),
          SizedBox(height: 8.h),
          EditAmoutTextFeild(
            amout: widget.transaction.amount.toString(),
            onChanged: (value) {
              widget.onAmountChanged(value);
            },
          ),

          SizedBox(height: 8.h),
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
                  verticalPadding: 6,
                  border: Border.all(color: Colors.grey.shade300),
                  onTap: () {
                    setState(() {
                      type = TransactionType.income;
                      widget.onTypeChanged(type);
                    });
                  },
                  child: CustomType(
                    type: TransactionType.income,
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
                  verticalPadding: 6,
                  border: Border.all(color: Colors.grey.shade300),
                  onTap: () {
                    setState(() {
                      type = TransactionType.expense;
                      widget.onTypeChanged(type);
                    });
                  },
                  child: CustomType(
                    type: TransactionType.expense,
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
    );
  }
}
