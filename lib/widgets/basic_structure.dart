import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/transaction.dart';
import 'package:personal_expenses_app/widgets/new_transaction.dart';
import 'package:personal_expenses_app/widgets/transaction_list.dart';
import 'package:personal_expenses_app/widgets/user_transaction.dart';

import 'chart.dart';

class  BasicStructure extends StatefulWidget {
  @override
  _BasicStructureState createState() => _BasicStructureState();
}

class _BasicStructureState extends State<BasicStructure> {
  String titleInput;

  String amountInput;

  final titleController = TextEditingController();

  final amountController = TextEditingController();
  final List<Transaction> _userTransactions = [
    // Transaction(id: 't1',
    //     title: 'New Shoes',
    //     amount: 69.9,
    //     date: DateTime.now()),
    // Transaction(id: 't2',
    //     title: 'Weekly Groceries',
    //     amount: 35.34,
    //     date: DateTime.now()),
    // Transaction(id: 't3',
    //     title: 'Monitor',
    //     amount: 350.67,
    //     date: DateTime.now())
  ];
  List<Transaction> get _recentTransactions {
    return (
    _userTransactions.where((filtertx) {
      return filtertx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList()
    );

  }
  void _addNewTransaction(
      String title,double amount){
    final newTx = Transaction(title: title,amount: amount,date: DateTime.now(),id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTx);
    });
  }
  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return NewTransaction(_addNewTransaction);
    });
  }
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
        title: Text("Personal Expenses",style:TextStyle(fontFamily: 'Open Sans')),
        actions: [
          IconButton(icon: Icon(Icons.add),
              onPressed: ()=> _startAddNewTransaction(context))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //  Chart placeholder
              // Container(
              //     color: Colors.blue,
              //     width: double.infinity,
              //     child:
              //     Card(
              //       color: Colors.blue,
              //       child: Text('CHART!'),))
            Chart(_recentTransactions),
            // UserTransactions(),
              TransactionList(_userTransactions),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>_startAddNewTransaction(context),
      ),
    );
  }
}
