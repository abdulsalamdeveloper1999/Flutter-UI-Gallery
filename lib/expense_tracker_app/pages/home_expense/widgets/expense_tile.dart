import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_ui_portfolio/expense_tracker_app/models/expense_model.dart';
import 'package:flutter_ui_portfolio/utils/colors.dart';

import '../../../../reusable_widgets/custom_text.dart';

class ExpenseTile extends StatelessWidget {
  final ExpenseModel myExpense;
  final Function(BuildContext)? deleteTapped;
  const ExpenseTile({super.key, required this.myExpense, this.deleteTapped});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              padding: const EdgeInsets.all(0),
              onPressed: deleteTapped,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        ),
        child: Container(
          // margin: const EdgeInsets.only(top: 15, right: 20, left: 20),
          decoration: BoxDecoration(
            color: GlobalColors.kblue,
            borderRadius: BorderRadius.circular(4),
          ),
          child: ListTile(
            title: CustomText(
              text: myExpense.name.toUpperCase(),
              color: Colors.white,
              size: 16,
              weight: FontWeight.bold,
            ),
            subtitle: CustomText(
              text:
                  '${myExpense.dateTime.day}/${myExpense.dateTime.month}/${myExpense.dateTime.year}',
              color: Colors.white,
              size: 14,
            ),
            trailing: CustomText(
              text: '\$${myExpense.amount}',
              size: 16,
              weight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
