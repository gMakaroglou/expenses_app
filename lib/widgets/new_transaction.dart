import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewTX;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  NewTransaction(this.addNewTX);
  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0){
      return;
    }

    addNewTX(enteredTitle, enteredAmount);
  }
  @override
  Widget build(BuildContext context) {
    return             Card(
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
              keyboardType: TextInputType.number,
              onSubmitted: (_)=>{submitData()},
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              controller: amountController,
            ),
            FlatButton(
                textColor: Colors.purple,
                child: Text('Add Transaction'),
                onPressed: ()=>submitData())
          ],
        ),
      ),
    );
  }
}
