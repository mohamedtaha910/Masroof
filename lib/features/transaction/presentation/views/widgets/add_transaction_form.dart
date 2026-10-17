import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:masroof/core/utils/categories.dart';
import 'package:masroof/core/widgets/custom_glass.dart';
import 'package:masroof/features/transaction/domain/entities/tranaction_entity.dart';
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
  TransactionType type = TransactionType.income;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                debugPrint(value);
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
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                color: Colors.white.withAlpha(100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Title', style: TextStyle(color: Colors.black54)),
                    // SizedBox(height: 4.h),
                    TransactionTextFeild(
                      onChanged: (value) {
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
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                color: Colors.white.withAlpha(100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Date', style: TextStyle(color: Colors.black54)),
                    SizedBox(height: 6.h),
                    TransactionDateField(
                      onDateSelected: (value) {
                        debugPrint('${value.day}');
                      },
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16.h),
            CategoriesSelect(type: type),
            // NoteTextFeild(
            //   onNoteSelected: (value) {
            //     debugPrint(value);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

class CategoriesSelect extends StatelessWidget {
  const CategoriesSelect({super.key, required this.type});
  final TransactionType type;

  @override
  Widget build(BuildContext context) {
    final List<Category> categories = type == TransactionType.income
        ? AppCategories.incomes
        : AppCategories.expenses;
    return CustomGlass(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
        color: Colors.white.withAlpha(100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Categories', style: TextStyle(color: Colors.black54)),
            Wrap(
              children: List.generate(categories.length, (index) {
                return CategoryShip(category: categories[index]);
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryShip extends StatelessWidget {
  final Category category;
  const CategoryShip({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Text(category.name);
  }
}
