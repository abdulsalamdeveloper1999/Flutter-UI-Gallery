import 'package:flutter/material.dart';
import 'package:flutter_ui_portfolio/expense_tracker_app/data/expense_data.dart';
import 'package:flutter_ui_portfolio/expense_tracker_app/models/expense_model.dart';
import 'package:flutter_ui_portfolio/expense_tracker_app/pages/home_expense/widgets/expense_tile.dart';
import 'package:flutter_ui_portfolio/reusable_widgets/custom_field.dart';
import 'package:flutter_ui_portfolio/reusable_widgets/custom_snackbar.dart';
import 'package:flutter_ui_portfolio/reusable_widgets/custom_text.dart';
import 'package:flutter_ui_portfolio/utils/colors.dart';
import 'package:provider/provider.dart';

import 'widgets/expense_summary.dart';

class HomwExpense extends StatefulWidget {
  const HomwExpense({super.key});

  @override
  State<HomwExpense> createState() => _HomwExpenseState();
}

class _HomwExpenseState extends State<HomwExpense> {
  final expenseNameController = TextEditingController();
  final expenseAmountController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    expenseAmountController.dispose();
    expenseNameController.dispose();
  }

  @override
  void initState() {
    super.initState();
    Provider.of<ExpenseData>(context, listen: false).prepareData();
  }

  void deleteExpense(item) {
    Provider.of<ExpenseData>(context, listen: false).deletExpense(item);
  }

  void save() {
    if (expenseAmountController.text.isNotEmpty &&
        expenseNameController.text.isNotEmpty) {
      ExpenseModel expense = ExpenseModel(
        name: expenseNameController.text,
        amount: expenseAmountController.text,
        dateTime: DateTime.now(),
      );
      Provider.of<ExpenseData>(context, listen: false).addExpense(expense);
      clearController();
      Navigator.pop(context);
    } else {
      showSnackBar(context, 'Fields are required');
    }
  }

  void addNewExpense() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: GlobalColors.kblue,
          title: const CustomText(
            text: 'Add New Expense',
            color: Colors.white,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              textField(
                  'Expense Name', expenseNameController, TextInputType.name),
              textField('Expense Amount', expenseAmountController,
                  TextInputType.number),
            ],
          ),
          actions: [
            MaterialButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
                clearController();
              },
              child: const CustomText(
                text: 'Cancel',
                color: Colors.red,
              ),
            ),
            MaterialButton(
              color: Colors.white,
              onPressed: save,
              child: const CustomText(
                text: 'Save',
                color: Colors.blue,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ExpenseData>(
        builder: (context, val, child) {
          return Scaffold(
            backgroundColor: GlobalColors.kblack,
            floatingActionButton: FloatingActionButton(
              onPressed: addNewExpense,
              child: const Icon(Icons.add),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  ExpenseSummary(startofweek: val.startOfTheWeekDay()),
                  val.getAllExpenseList().isEmpty
                      ? const Center(
                          child: Padding(
                          padding: EdgeInsets.only(top: 200),
                          child: CustomText(
                            text: 'No Expenses',
                            weight: FontWeight.w600,
                            size: 22,
                          ),
                        ))
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: val.getAllExpenseList().length,
                          itemBuilder: (_, innerIndex) {
                            var myExpense = val.overallList[innerIndex];
                            return ExpenseTile(
                              myExpense: myExpense,
                              deleteTapped: (p0) {
                                val.deletExpense(myExpense);
                              },
                            );
                          },
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget textField(text, controller, keyboardType) {
    return CustomTextField(
      keyboardType: keyboardType,
      cursor: Colors.white,
      style: const TextStyle(color: Colors.white),
      controller: controller,
      hintText: text,
      hintStyle: const TextStyle(color: Colors.white),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      border: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
    );
  }

  clearController() {
    expenseAmountController.clear();
    expenseNameController.clear();
  }
}
