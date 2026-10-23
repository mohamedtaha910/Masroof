import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/core/widgets/custom_button.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/presentation/manager/transaction_cubit/transaction_cubit.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/category_select.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/edit_amout_and_type.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/edit_transaction_date.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/edit_transaction_text_feild.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/edit_transaction_title.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/transaction_text_feild.dart';

class EditTransactionForm extends StatefulWidget {
  const EditTransactionForm({super.key, required this.oldTransaction});
  final TransactionEntity oldTransaction;

  @override
  State<EditTransactionForm> createState() => _EditTransactionFormState();
}

class _EditTransactionFormState extends State<EditTransactionForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  late double amount;
  late String title;
  late DateTime date;
  late Category category;
  late String note;
  late TransactionType type;

  @override
  void initState() {
    super.initState();
    title = widget.oldTransaction.title;
    amount = widget.oldTransaction.amount;
    date = widget.oldTransaction.date;
    category = widget.oldTransaction.category;
    note = widget.oldTransaction.note;
    type = widget.oldTransaction.type;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
          child: Column(
            children: [
              SizedBox(height: 90.h),

              // Text(title),
              EditAmountAndType(
                onAmountChanged: (value) {
                  amount = double.tryParse(value.replaceAll(',', '.')) ?? 0;
                  debugPrint(amount.toString());
                },
                onTypeChanged: (value) {
                  setState(() {
                    type = value;
                    debugPrint(type.name);
                  });
                },
                transaction: widget.oldTransaction,
              ),
              SizedBox(height: 12.h),
              EditTransactionTitle(
                title: title,
                onTextChanged: (value) {
                  title = value;
                  debugPrint(title);
                },
              ),
              SizedBox(height: 12.h),
              EditDate(
                date: date,
                onDateChanged: (value) {
                  date = value;
                  debugPrint(date.toString());
                },
              ),
              SizedBox(height: 12.h),
              CategoriesSelect(
                type: type,
                onCategorySelected: (value) {
                  category = value;
                  debugPrint(category.name);
                },
                initialCategory: category,
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(100),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white.withAlpha(180)),
                ),
                child: EditTransactionTextFeild(
                  maxLines: 4,
                  text: note,
                  validate: true,
                  onChanged: (value) {
                    note = value;
                  },
                ),
              ),
              SizedBox(height: 12.h),
              CustomButton(
                borderRadius: 100,
                colors: [AppColors.primaryColor],
                horizontalPadding: 20,
                verticalPadding: 10,
                onTap: () {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});

                  if (formKey.currentState!.validate()) {
                    TransactionEntity transaction = TransactionEntity(
                      title: title,
                      amount: amount,
                      type: type,
                      category: category,
                      date: date,
                      note: note,
                    );
                    BlocProvider.of<TransactionsCubit>(
                      context,
                    ).updateTransaction(transaction: transaction);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
