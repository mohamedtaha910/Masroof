import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/app_routes.dart';
import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/core/widgets/custom_button.dart';
import 'package:masroof/core/widgets/custom_glass.dart';
import 'package:masroof/features/auth/presentation/views/widgets/show_auth_error_message.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/presentation/manager/transaction_cubit/transaction_cubit.dart';
import 'package:masroof/features/transaction/presentation/manager/transaction_cubit/transaction_state.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/category_select.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/note_text_feild.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/transaction_amount_and_type.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/transaction_date_picker.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/transaction_text_feild.dart';

class AddTransactionForm extends StatefulWidget {
  const AddTransactionForm({super.key});

  @override
  State<AddTransactionForm> createState() => _AddTransactionFormState();
}

class _AddTransactionFormState extends State<AddTransactionForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;

  TransactionType type = TransactionType.income;
  late double amount;
  late String title;
  late DateTime date;
  late Category category;
  String note = '';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionsCubit, TransactionsState>(
      listener: (context, state) {
        if (state is TransactionAdded) {
          GoRouter.of(context).go(AppRoutes.kHomePage);
        } else if (state is TransactionsError) {
          showAuthErrorMessage(context, message: state.message);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100.h),

                  TransactionAmountAndType(
                    onAmountSelected: (value) {
                      setState(() {
                        amount =
                            double.tryParse(value.replaceAll(',', '.')) ?? 0;
                      });
                      debugPrint(amount.toString());
                    },
                    onTypeSelected: (value) {
                      setState(() {
                        type = value;
                        debugPrint(value.name);
                      });
                    },
                  ),
                  SizedBox(height: 16.h),
                  CustomGlass(
                    radius: 14,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 16.w,
                      ),
                      color: Colors.white.withAlpha(100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Title',
                            style: TextStyle(color: Colors.black54),
                          ),
                          // SizedBox(height: 4.h),
                          TransactionTextFeild(
                            onChanged: (value) {
                              title = value;
                              debugPrint(value);
                            },
                            hint: 'Add Title',
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  CustomGlass(
                    radius: 14,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 16.w,
                      ),
                      color: Colors.white.withAlpha(100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Date', style: TextStyle(color: Colors.black54)),
                          SizedBox(height: 6.h),
                          TransactionDateField(
                            onDateSelected: (value) {
                              date = value;
                              debugPrint('${value.day}');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 16.h),
                  CategoriesSelect(
                    type: type,
                    onCategorySelected: (value) {
                      category = value;
                      debugPrint(value.name);
                    },
                  ),
                  SizedBox(height: 16.h),
                  NoteTextFeild(
                    onNoteSelected: (value) {
                      setState(() {
                        note = value;
                        // debugPrint(value);
                      });
                    },
                  ),
                  SizedBox(height: 16.h),
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
                        ).addTransaction(transaction: transaction);
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add Transaction',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
