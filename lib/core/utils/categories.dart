class Category {
  final String name;
  final String iconPath;

  const Category({required this.name, required this.iconPath});
}

class AppCategories {
  // ==========expense Categoy ====================

  static const food = Category(
    name: 'Food',
    iconPath: 'assets/category_icons/food4.png',
  );

  static const transport = Category(
    name: 'Transport',
    iconPath: 'assets/category_icons/transport.png',
  );

  static const bills = Category(
    name: 'Bills',
    iconPath: 'assets/category_icons/bill.png',
  );

  static const shopping = Category(
    name: 'Shopping',
    iconPath: 'assets/category_icons/shopping.png',
  );

  static const health = Category(
    name: 'Health',
    iconPath: 'assets/category_icons/medicine1.png',
  );

  static const education = Category(
    name: 'Education',
    iconPath: 'assets/category_icons/education.png',
  );

  static const entertainment = Category(
    name: 'Entertainment',
    iconPath: 'assets/category_icons/entertainment.png',
  );

  static const financial = Category(
    name: 'Financial',
    iconPath: 'assets/category_icons/visa_card.png',
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
  );

  static const other = Category(
    name: 'Other',
    iconPath: 'assets/category_icons/other.png',
  );

  static const List<Category> expenses = [
    bills,
    shopping,
    financial,
    health,
    education,
    food,
    transport,
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
