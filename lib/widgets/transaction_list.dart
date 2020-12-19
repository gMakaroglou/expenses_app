import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/transaction.dart';
class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
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
      body: Center(
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
            Card(
              elevation: 5,
              child:
              Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                    decoration: InputDecoration(
                      labelText: "Title",
                    ),
                      // onChanged: (val) => {titleInput = val},
                      controller: titleController,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: "Amount",
                      ),
                      // onChanged: (val) => {amountInput = val},
                      controller: amountController,
                    ),
                    FlatButton(
                        textColor: Colors.purple,
                        child: Text('Add Transaction'),
                        onPressed: ()=>{
                          print(amountInput),
                          print(titleInput),
                        })
                  ],
                ),
              ),
            ),
            Column(
                children : transactions.map((tx){
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
                              border: Border.all(color : Colors.purple , width: 2,),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text('\$'+tx.amount.toString(),style: TextStyle(
                              fontSize: 20,
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                            ),)
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(tx.title,style: TextStyle
                              (
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),),
                            Text(
                                DateFormat('yyyy-MM-dd').format(tx.date),style: TextStyle
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
            }).toList(),)
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
