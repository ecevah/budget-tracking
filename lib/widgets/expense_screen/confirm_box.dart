import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_provider/models/database_provider.dart';
import 'package:sqlite_provider/models/expense.dart';

class ConfirmBox extends StatelessWidget {
  const ConfirmBox({
    super.key,
    required this.exp,
  });

  final Expense exp;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return AlertDialog(
      title: Text('Delete ${exp.title} ?'),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Don\'t delete'),
          ),
          const SizedBox(width: 5.0),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(true);
              provider.deleteExpense(exp.id, exp.category, exp.amount);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
