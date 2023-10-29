import 'package:hive_flutter/hive_flutter.dart';

import '../models/expense_model.dart';
import '../utils/constants.dart';

class HiveDB {
  //reference out box
  final _mybox = Hive.box(hiveDb);

  //write data
  void saveData(List<ExpenseModel> expenseList) {
/*

Hive can only store strings and datetime and not custome bject like ExpenseItem

So lets convert ExpenseItem objects into types list that can be stored in our db

allExpense=[

  ExpenseItems(name/amount/dataTie)
  ...
]

->

[
  [
    [name,amount,dataTie],
    ...
  ]
]
*/

    List<List<dynamic>> allExpenseFormatted = [];

    for (var expense in expenseList) {
      //convert each expenseItem into a list of storable types(stirngs ,dateTime)
      List<dynamic> expenseFormatted = [
        expense.name,
        expense.amount,
        expense.dateTime,
      ];

      allExpenseFormatted.add(expenseFormatted);
    }

    _mybox.put('All_Expenses', allExpenseFormatted);
  }

  //read data
  List<ExpenseModel> readData() {
    /*
  Data is stored in hive as a list of strings->dateTime so lets convert our saved data into ExpenseItem Object


  savedData=
  [


[name,amount,dateTime],
...

  ]
  ->ExpenseItem(name,amunt,dateTime)
  */

    List savedExpense = _mybox.get('All_Expenses') ?? [];
    List<ExpenseModel> allExpenses = [];

    for (var i = 0; i < savedExpense.length; i++) {
      //collect individual expsen data
      String name = savedExpense[i][0];
      String amount = savedExpense[i][1];
      DateTime dateTime = savedExpense[i][2];

      //create expense item
      ExpenseModel expense = ExpenseModel(
        name: name,
        amount: amount,
        dateTime: dateTime,
      );
      //add expense to overall list of expenses
      allExpenses.add(expense);
    }
    return allExpenses;
  }
}
