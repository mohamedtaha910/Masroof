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
  DateTime date = DateTime.now();
  Category? category;
  String note = '';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionsCubit, TransactionsState>(
      listener: (context, state) {
        if (state is TransactionAdded) {
          GoRouter.of(context).pop();
        } else if (state is TransactionsError) {
          showErrorMessage(context, message: state.message, isAuth: false);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            // physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 90.h),

                  TransactionAmountAndType(
                    onAmountSelected: (value) {
                      // setState(() {
                      amount = double.tryParse(value.replaceAll(',', '.')) ?? 0;
                      // });
                      debugPrint(amount.toString());
                    },
                    onTypeSelected: (value) {
                      setState(() {
                        type = value;
                        category =
                            category == AppCategories.other ||
                                category == AppCategories.gifts
                            ? category
                            : null;
                        // debugPrint(value.name);
                      });
                    },
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 16.w,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(100),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white.withAlpha(180)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12.sp,
                          ),
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
                  SizedBox(height: 12.h),

                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.h,
                      horizontal: 16.w,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(100),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white.withAlpha(180)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   'Date',
                        //   style: TextStyle(
                        //     color: Colors.black54,
                        //     fontSize: 12.sp,
                        //   ),
                        // ),
                        // SizedBox(height: 4.h),
                        TransactionDateField(
                          onDateSelected: (value) {
                            date = value;
                            debugPrint('${value.day}');
                          },
                        ),
                      ],
                    ),
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
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) {
                      //       return CategoriesSelect(
                      //         type: type,
                      //         onCategorySelected: (value) {
                      //           setState(() {
                      //             category = value;
                      //           });
                      //           debugPrint(value.name);
                      //         },
                      //       );
                      //     },
                      //   ),
                      // );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 16.h,
                        horizontal: 16.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(100),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white.withAlpha(180)),
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
                                : Image.asset(category!.iconPath, height: 22),
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
                  // CategoriesSelect(
                  //   type: type,
                  //   onCategorySelected: (value) {
                  //     category = value;
                  //     debugPrint(value.name);
                  //   },
                  // ),
                  SizedBox(height: 12.h),
                  NoteTextFeild(
                    onNoteSelected: (value) {
                      // setState(() {
                      note = value;
                      // debugPrint(value);
                      // });
                    },
                  ),
                  SizedBox(height: 12.h),
                  CustomButton(
                    width: double.infinity,
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
                            title: title,
                            amount: amount,
                            type: type,
                            category: category!,
                            date: date,
                            note: note,
                          );
                          BlocProvider.of<TransactionsCubit>(
                            context,
                          ).addTransaction(transaction: transaction);
                        }
                      }
                    },
                    child: Text(
                      'Add Transaction',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
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
