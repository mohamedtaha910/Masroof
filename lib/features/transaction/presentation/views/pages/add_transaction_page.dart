import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:masroof/core/widgets/custom_glass.dart';
import 'package:masroof/features/transaction/presentation/views/widgets/add_transaction_form.dart';

class AddTransactionPage extends StatelessWidget {
  const AddTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomGlass(
              child: GestureDetector(
                onTap: () => GoRouter.of(context).pop(),
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(color: Colors.white.withAlpha(100)),
                  child: Icon(Icons.chevron_left_rounded, size: 28.sp),
                ),
              ),
            ),
            Spacer(),
            Text('Add Transaction', style: TextStyle(fontSize: 18.sp)),
            Spacer(),
            // SizedBox(width: 16.w),
          ],
        ),

        // centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),

      body: AddTransactionForm(),
    );
  }
}
