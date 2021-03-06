import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String,Object>> get groupTransactionValues{
    return List.generate(7, (index){
      //calculate weekday
      final weekDay = DateTime.now().subtract(Duration(days:index),);
      //calculate sum
      var totalSum = 0.0;
      for(var i = 0; i < recentTransactions.length;i++){
        if(recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year)
          {
            totalSum += recentTransactions[i].amount;
          }
      }
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin:EdgeInsets.all(20),
      child: Row(
        children: [

        ],
      ),
    );
  }
}
