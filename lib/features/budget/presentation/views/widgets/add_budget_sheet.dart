import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/core/widgets/custom_button.dart';

class AddBudgetBottomSheet extends StatefulWidget {
  const AddBudgetBottomSheet({
    super.key,
    required this.category,
    required this.selectedMonth,
    required this.onCreate,
  });

  final Category category;
  final DateTime selectedMonth;
  final void Function(double amount) onCreate;

  @override
  State<AddBudgetBottomSheet> createState() => _AddBudgetBottomSheetState();
}

class _AddBudgetBottomSheetState extends State<AddBudgetBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  String get formattedMonth {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    return '${months[widget.selectedMonth.month - 1]} ${widget.selectedMonth.year}';
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final amount = double.parse(_amountController.text.trim());

    widget.onCreate(amount);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 20.h,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: AppColors.mutedColor.withAlpha(100),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ),
              SizedBox(height: 22.h),

              Text(
                'Create Budget',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 5.h),

              Text(
                'Set a spending limit for this category.',
                style: TextStyle(fontSize: 12.sp, color: AppColors.mutedColor),
              ),
              SizedBox(height: 22.h),

              // Selected Category
              Container(
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: AppColors.neutralColor.withAlpha(150),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: Colors.grey.shade300.withAlpha(180),
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(widget.category.iconPath, height: 22.h),
                    SizedBox(width: 12.w),
                    Text(
                      widget.category.name,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Category',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: AppColors.mutedColor,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 18.h),

              Text(
                'Budget Amount',
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8.h),

              TextFormField(
                controller: _amountController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter amount',
                  hintStyle: TextStyle(fontSize: 12.sp),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 10.h,
                  ),
                  prefixText: '£ ',
                  filled: true,
                  fillColor: AppColors.neutralColor.withAlpha(100),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300.withAlpha(180),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300.withAlpha(180),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: Colors.blue.shade300.withAlpha(180),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a budget amount';
                  }

                  final amount = double.tryParse(value.trim());

                  if (amount == null || amount <= 0) {
                    return 'Enter a valid amount greater than zero';
                  }

                  return null;
                },
              ),

              SizedBox(height: 18.h),

              // Selected Month
              Row(
                children: [
                  Icon(
                    Iconsax.calendar,
                    color: AppColors.secondaryColor,
                    size: 20.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'Budget Period',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.mutedColor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    formattedMonth,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  width: double.infinity,
                  borderRadius: 12,
                  colors: [
                    AppColors.primaryColor.withAlpha(180),
                    AppColors.primaryColor.withAlpha(220),
                  ],
                  horizontalPadding: 16,
                  verticalPadding: 10,
                  onTap: _submit,
                  child: Text(
                    'Create Budget',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
