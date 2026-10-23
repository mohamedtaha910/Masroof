import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:masroof/core/utils/app_colors.dart';

class TransactionDateField extends StatefulWidget {
  const TransactionDateField({
    super.key,
    required this.onDateSelected,
    this.initialDate,
  });
  final ValueChanged<DateTime> onDateSelected;
  final DateTime? initialDate;

  @override
  State<TransactionDateField> createState() => _TransactionDateFieldState();
}

class _TransactionDateFieldState extends State<TransactionDateField> {
  late DateTime selectedDate;

  Future<void> pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: Color(0xFF80B7FF),
              onPrimary: AppColors.primaryColor,
              surface: AppColors.primaryColor,
              onSurface: Colors.white,
            ),
            datePickerTheme: DatePickerThemeData(
              backgroundColor: AppColors.primaryColor,
              headerBackgroundColor: AppColors.secondaryColor,
              headerForegroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              dayShape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              todayForegroundColor: WidgetStatePropertyAll(
                AppColors.tertiaryColor,
              ),
              todayBorder: const BorderSide(color: Color(0xFF80B7FF)),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
    widget.onDateSelected(selectedDate);
  }

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('MMMM dd, yyyy').format(selectedDate);
    return InkWell(
      onTap: pickDate,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            Icon(Iconsax.calendar_1_copy, color: Colors.black54, size: 22.w),
            SizedBox(width: 12.w),
            Text(
              // ' ${selectedDate.day}/${selectedDate.month}/${selectedDate.year} ',
              formattedDate,
              style: TextStyle(fontSize: 12.5.sp),
            ),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_down_rounded),
          ],
        ),
      ),
    );
  }
}
