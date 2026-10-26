import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:masroof/core/utils/app_colors.dart';
import 'package:masroof/core/utils/app_routes.dart';
import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/core/widgets/custom_button.dart';
import 'package:masroof/features/auth/presentation/views/widgets/show_auth_error_message.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
import 'package:masroof/features/transaction/presentation/manager/transaction_cubit/transaction_cubit.dart';
import 'package:masroof/features/transaction/presentation/manager/transaction_cubit/transaction_state.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/category_select.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/edit_amout_and_type.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/edit_transaction_date.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/edit_transaction_text_feild.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/edit_transaction_title.dart';

class EditTransactionForm extends StatefulWidget {
  const EditTransactionForm({super.key, required this.oldTransaction});
  final TransactionEntity oldTransaction;

  @override
  State<EditTransactionForm> createState() => _EditTransactionFormState();
}

class _EditTransactionFormState extends State<EditTransactionForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  late String id;
  late double amount;
  late String title;
  late DateTime date;
  late Category? category;
  late String note;
  late TransactionType type;

  @override
  void initState() {
    super.initState();
    id = widget.oldTransaction.id!;
    title = widget.oldTransaction.title;
    amount = widget.oldTransaction.amount;
    date = widget.oldTransaction.date;
    category = widget.oldTransaction.category;
    note = widget.oldTransaction.note;
    type = widget.oldTransaction.type;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionsCubit, TransactionsState>(
      listener: (context, state) {
        if (state is TransactionUpdated) {
          // GoRouter.of(context).pushReplacement(AppRoutes.kTransactionDetails , extra: );
          GoRouter.of(context).pop();
          GoRouter.of(context).pop();
        } else if (state is TransactionsError) {
          showErrorMessage(context, message: state.message, isAuth: false);
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Form(
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
                        amount =
                            double.tryParse(value.replaceAll(',', '.')) ?? 0;
                        debugPrint(amount.toString());
                      },
                      onTypeChanged: (value) {
                        setState(() {
                          type = value;
                          category =
                              category == AppCategories.other ||
                                  category == AppCategories.gifts
                              ? category
                              : null;
                          // debugPrint(type.name);
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
                    GestureDetector(
                      onTap: () {
                        context.push(
                          AppRoutes.kCategoriesSelect,
                          extra: {
                            'initialCategory': category,
                            'type': type,
                            'onCategorySelected': (Category value) {
                              setState(() {
                                category = value;
                              });
                              debugPrint(value.name);
                            },
                          },
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 14.h,
                          horizontal: 16.w,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(100),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.white.withAlpha(180),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(7.h),
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
                              child: category == null
                                  ? Icon(
                                      Iconsax.category,
                                      size: 18,
                                      color: Colors.black54,
                                    )
                                  : Image.asset(
                                      category!.iconPath,
                                      height: 19.h,
                                    ),
                            ),
                            SizedBox(width: 12.w),
                            category == null
                                ? Text(
                                    'Select Category',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.black54,
                                    ),
                                  )
                                : Text(
                                    category!.name,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                            Spacer(),
                            Icon(Icons.chevron_right_rounded, size: 24.sp),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 16.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(100),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white.withAlpha(180)),
                      ),
                      child: EditTransactionTextFeild(
                        maxLines: 5,
                        text: note,
                        validate: false,
                        onChanged: (value) {
                          note = value;
                        },
                      ),
                    ),
                    SizedBox(height: 14.h),
                    CustomButton(
                      borderRadius: 100,
                      colors: [AppColors.primaryColor],
                      horizontalPadding: 20,
                      verticalPadding: 10,
                      onTap: () {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});

                        if (formKey.currentState!.validate()) {
                          if (category == null) {
                            showErrorMessage(
                              context,
                              message: 'You Must Choose Category',
                              isAuth: false,
                            );
                          } else {
                            TransactionEntity transaction = TransactionEntity(
                              id: id,
                              title: title,
                              amount: amount,
                              type: type,
                              category: category!,
                              date: date,
                              note: note,
                            );
                            BlocProvider.of<TransactionsCubit>(
                              context,
                            ).updateTransaction(transaction: transaction);
                          }
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
          ),
        );
      },
    );
  }
}
