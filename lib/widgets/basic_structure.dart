import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/transaction.dart';
import 'package:personal_expenses_app/widgets/new_transaction.dart';
import 'package:personal_expenses_app/widgets/transaction_list.dart';
import 'package:personal_expenses_app/widgets/user_transaction.dart';

class  BasicStructure extends StatelessWidget {
  String titleInput;

  String amountInput;

  final titleController = TextEditingController();

  final amountController = TextEditingController();

  final List<Transaction> transactions = [
    Transaction(id: 't1',
        title: 'New Shoes',
        amount: 69.9,
        date: DateTime.now()),
    Transaction(id: 't2',
        title: 'Weekly Groceries',
        amount: 35.34,
        date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("expenses"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  color: Colors.blue,
                  width: double.infinity,
                  child:
                  Card(
                    color: Colors.blue,
                    child: Text('CHARTS'),)),
            UserTransactions(),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
