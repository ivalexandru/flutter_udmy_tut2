import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    //convert it to double
    final enteredAmount = double.parse(amountController.text);

//verifica tastezi cand introduci o noua tranzactie,
//daca nu introduci ce trebuie nu te lasa sa dai submit
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      //if i return here, the code below will not execute
      return;
    }
// cu widget. poti accesa properties and methods of your Widget class inside your State class

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );
//closes the top most screen that is displayed
//aka dupa ce introduci chestii in form si dai ok, sa dispara form
//context nu e definit de tine in clasa, e available ca si widget, in State Class
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
