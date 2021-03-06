import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/transaction.dart';
import 'package:personal_expenses_app/widgets/new_transaction.dart';
import 'package:personal_expenses_app/widgets/transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(id: 't1',
        title: 'New Shoes',
        amount: 69.9,
        date: DateTime.now()),
    Transaction(id: 't2',
        title: 'Weekly Groceries',
        amount: 35.34,
        date: DateTime.now()),
    Transaction(id: 't3',
        title: 'Monitor',
        amount: 350.67,
        date: DateTime.now())
  ];
  void _addNewTransaction(
      String title,double amount){
    final newTx = Transaction(title: title,amount: amount,date: DateTime.now(),id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTx);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
       NewTransaction(_addNewTransaction),
       // TransactionList(_userTransactions),

     ],
    );
  }
}
