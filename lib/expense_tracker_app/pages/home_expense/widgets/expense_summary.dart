import 'package:flutter/material.dart';
import 'package:flutter_ui_portfolio/expense_tracker_app/data/expense_data.dart';
import 'package:flutter_ui_portfolio/expense_tracker_app/date_time/date_time.dart';
import 'package:flutter_ui_portfolio/expense_tracker_app/pages/home_expense/widgets/my_bar_graph.dart';
import 'package:flutter_ui_portfolio/reusable_widgets/custom_text.dart';
import 'package:provider/provider.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startofweek;
  const ExpenseSummary({super.key, required this.startofweek});

  //calcaulate this week total
  String calculateThisWeekTotal(
    ExpenseData value,
    String sunday,
    String monday,
    String tuesday,
    String wednesday,
    String thursday,
    String friday,
    String saturday,
  ) {
    List<double> values = [
      value.calculateDailyExpenseSummary()[sunday] ?? 0,
      value.calculateDailyExpenseSummary()[monday] ?? 0,
      value.calculateDailyExpenseSummary()[tuesday] ?? 0,
      value.calculateDailyExpenseSummary()[wednesday] ?? 0,
      value.calculateDailyExpenseSummary()[thursday] ?? 0,
      value.calculateDailyExpenseSummary()[friday] ?? 0,
      value.calculateDailyExpenseSummary()[saturday] ?? 0,
    ];

    double total = 0;
    for (var i = 0; i < values.length; i++) {
      total += values[i];
    }
    return total.toStringAsFixed(2);
  }

  double calulcateMax(
    ExpenseData value,
    String sunday,
    String monday,
    String tuesday,
    String wednesday,
    String thursday,
    String friday,
    String saturday,
  ) {
    double max = 100;
    List<double> values = [
      value.calculateDailyExpenseSummary()[sunday] ?? 0,
      value.calculateDailyExpenseSummary()[monday] ?? 0,
      value.calculateDailyExpenseSummary()[tuesday] ?? 0,
      value.calculateDailyExpenseSummary()[wednesday] ?? 0,
      value.calculateDailyExpenseSummary()[thursday] ?? 0,
      value.calculateDailyExpenseSummary()[friday] ?? 0,
      value.calculateDailyExpenseSummary()[saturday] ?? 0,
    ];

    //sot from smallet to largest
    values.sort();
    //get larget amunt (which will be at the end)
    //and increase the cap slightly so the grapgh looks almost full
    max = values.last * 1.1;
    return max == 0 ? 100 : max;
  }

  @override
  Widget build(BuildContext context) {
    //get yymmdd for each day of this week
    String sunday =
        convertDateTimeToString(startofweek.add(const Duration(days: 0)));
    String monday =
        convertDateTimeToString(startofweek.add(const Duration(days: 1)));
    String tuesday =
        convertDateTimeToString(startofweek.add(const Duration(days: 2)));
    String wednesday =
        convertDateTimeToString(startofweek.add(const Duration(days: 3)));
    String thursday =
        convertDateTimeToString(startofweek.add(const Duration(days: 4)));
    String friday =
        convertDateTimeToString(startofweek.add(const Duration(days: 5)));
    String saturday =
        convertDateTimeToString(startofweek.add(const Duration(days: 6)));

    return Consumer<ExpenseData>(
      builder: (_, value, child) {
        return Column(
          children: [
            //week total
            Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                children: [
                  const CustomText(
                    text: 'Week Total:',
                    weight: FontWeight.w600,
                    color: Colors.white,
                    size: 16,
                  ),
                  CustomText(
                    weight: FontWeight.w700,
                    size: 18,
                    color: Colors.white,
                    text:
                        ' \$${calculateThisWeekTotal(value, sunday, monday, tuesday, wednesday, thursday, friday, saturday)}',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: MyBarGraph(
                maxY: calulcateMax(value, sunday, monday, tuesday, wednesday,
                    thursday, friday, saturday),
                sunAmount: value.calculateDailyExpenseSummary()[sunday] ?? 0,
                monAmount: value.calculateDailyExpenseSummary()[monday] ?? 0,
                tueAmount: value.calculateDailyExpenseSummary()[tuesday] ?? 0,
                wedAmount: value.calculateDailyExpenseSummary()[wednesday] ?? 0,
                thurAmount: value.calculateDailyExpenseSummary()[thursday] ?? 0,
                friAmount: value.calculateDailyExpenseSummary()[friday] ?? 0,
                satAmount: value.calculateDailyExpenseSummary()[saturday] ?? 0,
              ),
            ),
          ],
        );
      },
    );
  }
}
