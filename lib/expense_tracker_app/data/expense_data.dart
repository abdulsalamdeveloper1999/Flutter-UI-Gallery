import 'package:flutter/material.dart';
import 'package:flutter_ui_portfolio/expense_tracker_app/data/hive_databse.dart';
import 'package:flutter_ui_portfolio/expense_tracker_app/date_time/date_time.dart';
import 'package:flutter_ui_portfolio/expense_tracker_app/models/expense_model.dart';

class ExpenseData extends ChangeNotifier {
//List of all expendse
  List<ExpenseModel> overallList = [];

//get expense list
  List<ExpenseModel> getAllExpenseList() {
    return overallList;
  }

//prepare data to dispkay
  final db = HiveDB();
  void prepareData() {
    if (db.readData().isNotEmpty) {
      overallList = db.readData();
    }
    //if there exist data get it
  }

//add expense list
  void addExpense(ExpenseModel item) {
    overallList.add(item);
    notifyListeners();
    db.saveData(overallList);
  }

//delete expense
  void deletExpense(ExpenseModel item) {
    overallList.remove(item);
    notifyListeners();
    db.saveData(overallList);
  }

//get weekDay {min,tues, etc} from a date time object
  String getDayName(DateTime date) {
    switch (date.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 7:
        return 'Sat';
      case 8:
        return 'Sun';

      default:
        return '';
    }
  }

//get the date os start of the week
  DateTime startOfTheWeekDay() {
    DateTime? startOfTheWeek;
    // Get today's date
    DateTime today = DateTime.now();

    // Go backward from today to find Sunday
    for (var i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Sun') {
        startOfTheWeek = today.subtract(Duration(days: i));
        break; // Exit the loop once Sunday is found
      }
    }

    // Check if startOfTheWeek is not null before returning it
    if (startOfTheWeek != null) {
      return startOfTheWeek;
    } else {
      // Handle the case when startOfTheWeek is null (e.g., return today's date as a fallback)
      return today;
    }
  }

/*
convert overal lsut of expense into a daily response summary
e.g overalExpenseList=
[
[food,2023/01/30,$30]
[drinks,2023/01/30,$15]
[items,2023/01/30,$48]
]
->
DailyExpenseSumamry=
[
  [2023/01/30,$30],
  [2023/01/30,$15],
  [2023/01/30,$48],
]
*/

  Map<String, double> calculateDailyExpenseSummary() {
    Map<String, double> dailyExpenseSummary = {
      // date (yymmdd):amountTotalForDAY
    };
    for (var expense in overallList) {
      String date = convertDateTimeToString(expense.dateTime);
      double amount = double.parse(expense.amount);
      if (dailyExpenseSummary.containsKey(date)) {
        double currentAmount = dailyExpenseSummary[date]!;
        currentAmount += amount;
        dailyExpenseSummary[date] = currentAmount;
      } else {
        dailyExpenseSummary.addAll({date: amount});
      }
    }

    return dailyExpenseSummary;
  }
}
