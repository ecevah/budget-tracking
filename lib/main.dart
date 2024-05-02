import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_provider/models/database_provider.dart';
import 'package:sqlite_provider/screens/all_expenses.dart';
import 'package:sqlite_provider/screens/category_screen.dart';
import 'package:sqlite_provider/screens/expense_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => DatabaseProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: CategoryScreen.name,
      routes: {
        CategoryScreen.name: (_) => const CategoryScreen(),
        ExpenseScreen.name: (_) => const ExpenseScreen(),
        AllExpenses.name: (_) => const AllExpenses(),
      },
    );
  }
}
