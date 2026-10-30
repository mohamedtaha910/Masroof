// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:masroof/core/utils/app_colors.dart';

class Category {
  final String name;
  final String iconPath;
  final Color color;

  const Category({
    required this.name,
    required this.iconPath,
    this.color = AppColors.tertiaryColor,
  });
}

class AppCategories {
  // ==========expense Categoy ====================

  static const food = Category(
    name: 'Food',
    iconPath: 'assets/category_icons/food4.png',
    color: Colors.orange,
  );
  static const travelling = Category(
    name: 'Travelling',
    iconPath: 'assets/category_icons/travel.png',
    color: Colors.deepPurple,
  );

  static const transport = Category(
    name: 'Transport',
    iconPath: 'assets/category_icons/car2.png',
    color: Colors.amberAccent,
  );

  static const bills = Category(
    name: 'Bills',
    iconPath: 'assets/category_icons/bill.png',
    // color: Colors.brown,
    color: Color(0xFF1E4962),
  );

  static const shopping = Category(
    name: 'Shopping',
    iconPath: 'assets/category_icons/shopping.png',
    color: Colors.lightBlue,
  );

  static const health = Category(
    name: 'Health',
    iconPath: 'assets/category_icons/health.png',
    color: Colors.lightGreen,
  );

  static const education = Category(
    name: 'Education',
    iconPath: 'assets/category_icons/education2.png',
    color: Colors.blueGrey,
  );

  static const entertainment = Category(
    name: 'Entertainment',
    iconPath: 'assets/category_icons/entertainment.png',
    color: Colors.cyan,
  );

  static const financial = Category(
    name: 'Financial',
    iconPath: 'assets/category_icons/credit_card.png',
    color: Colors.indigoAccent,
  );

  // ==========income Categoy ====================

  static const salary = Category(
    name: 'Salary',
    iconPath: 'assets/category_icons/work.png',
  );

  static const freeLance = Category(
    name: 'FreeLance',
    iconPath: 'assets/category_icons/freelance2.png',
  );

  static const investments = Category(
    name: 'Investments',
    iconPath: 'assets/category_icons/investment.png',
  );

  static const refunds = Category(
    name: 'Refunds',
    iconPath: 'assets/category_icons/refund.png',
  );

  // ======== Both ==========

  static const gifts = Category(
    name: 'Gifts',
    iconPath: 'assets/category_icons/gift.png',
    color: Colors.pink,
  );

  static const other = Category(
    name: 'Other',
    iconPath: 'assets/category_icons/money.png',
    color: Colors.grey,
  );

  // ===========List =====================

  static const List<Category> expenses = [
    bills,
    health,
    shopping,
    financial,
    education,
    transport,
    food,
    travelling,
    entertainment,
    gifts,
    other,
  ];
  static const List<Category> incomes = [
    salary,
    investments,
    freeLance,
    refunds,
    gifts,
    other,
  ];
  static const List<Category> allCategories = [
    bills,
    shopping,
    financial,
    health,
    education,
    food,
    travelling,
    transport,
    entertainment,
    salary,
    investments,
    freeLance,
    refunds,
    gifts,
    other,
  ];
}
