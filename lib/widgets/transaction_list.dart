import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/transaction.dart';
class TransactionList extends StatelessWidget {
  // String titleInput;
  //
  // String amountInput;
  //
  // final titleController = TextEditingController();
  //
  // final amountController = TextEditingController();
  //
  // final List<Transaction> _userTransactions = [
  //   Transaction(id: 't1',
  //       title: 'New Shoes',
  //       amount: 69.9,
  //       date: DateTime.now()),
  //   Transaction(id: 't2',
  //       title: 'Weekly Groceries',
  //       amount: 35.34,
  //       date: DateTime.now()),
  //   Transaction(id: 't3',
  //       title: 'Monitor',
  //       amount: 350.67,
  //       date: DateTime.now())
  // ];
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 300,
        // child : SingleChildScrollView(
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index)  {
            return Card(
              child:
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 15.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color : Theme.of(context).primaryColor , width: 2,),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text('\$'+transactions[index].amount.toStringAsFixed(2),style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),)
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(transactions[index].title,style:
                          Theme.of(context).textTheme.title,
                        // fontWeight: FontWeight.bold,
                        // fontSize: 16,
                      ),
                      Text(
                          DateFormat('yyyy-MM-dd').format(transactions[index].date),style: TextStyle
                        (
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.blueGrey
                      )),

                    ],
                  )
                ],

              ),
            );
          },),
      // )
      );
  }
}
