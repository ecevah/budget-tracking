import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqlite_provider/constants/icons.dart';
import 'package:sqlite_provider/models/expense.dart';
import 'package:sqlite_provider/widgets/expense_screen/confirm_box.dart';

class ExpenseCard extends StatelessWidget {
  final Expense exp;
  const ExpenseCard(this.exp, {super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(exp.id),
      confirmDismiss: (_) async {
        showDialog(
          context: context,
          builder: (_) => ConfirmBox(exp: exp),
        );
        return null;
      },
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icons[exp.category]),
        ),
        title: Text(exp.title),
        subtitle: Text(DateFormat('MMMM dd, yyyy').format(exp.date)),
        trailing: Text(NumberFormat.currency(locale: 'tr_TR', symbol: '₺')
            .format(exp.amount)),
      ),
    );
  }
}
