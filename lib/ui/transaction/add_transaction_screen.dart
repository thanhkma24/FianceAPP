import 'package:example/data/helpers/transaction_helper.dart';
import 'package:example/data/model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:localizations/localizations.dart';

class AddTransactionScreen extends StatefulWidget {
  final Function updateList;
  final TransactionModel transactionModel;
  const AddTransactionScreen({Key? key, required this.updateList, required this.transactionModel}) : super(key: key);

  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _note;
  late String _moneyTotal;
  late int _transactionGroupId;
  DateTime _date = DateTime.now();
  final DateFormat _dateFormat = DateFormat("yMd");
  TextEditingController _dateController = TextEditingController();
   
  @override
  void initState() {
    if(widget.transactionModel !=null){
      _name = widget.transactionModel.name;
      _note = widget.transactionModel.note;
      _moneyTotal = widget.transactionModel.moneyTotal;
      _transactionGroupId = widget.transactionModel.transactionGroupId;
    }
    _dateController.text = _dateFormat.format(_date);
    super.initState();
  }
  
  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          image: DecorationImage(
            image: AssetImage('assets/images/login_background.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 21),
              child: Container(
                child: Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Text(
                      Translate.of(context).add_transaction,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFFFF7141)),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              child: Padding(
                padding: EdgeInsets.only(top: 16, left: 21, right: 21),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                    GroupButton(
                      spacing: 2,
                      buttons: [
                        Translate.of(context).collect,
                        Translate.of(context).spend
                      ],
                      onSelected: (int index, bool isSelected) {},
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            Translate.of(context).name,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 16),
                            ),
                            validator: (input) => input!.trim().isEmpty
                                ? 'Please enter a task title'
                                : null,
                            onSaved: (input) => _name = input!,
                            initialValue: _name,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            Translate.of(context).dateTime,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 5,
                          child: TextField(
                            controller: _dateController,
                            onTap: _handleDatePicker,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            Translate.of(context).group,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 5,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            Translate.of(context).money,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 4,
                          child:TextFormField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 16),
                            ),
                            validator: (input) => input!.trim().isEmpty
                                ? 'Please enter a task title'
                                : null,
                            onSaved: (input) => _moneyTotal = input!,
                            initialValue: _moneyTotal,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(" .000",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            Translate.of(context).note,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 5,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(21),
                        child: Container(
                          color: Color(0xFFFF7141),
                          height: 40,
                          width: 250,
                          child: TextButton(
                            onPressed: () {
                              _submit();
                            },
                            child: Text(
                              Translate.of(context).save,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 48,
                    ),
                  ]),
                ),
              ),
            )),
          ],
        ),
      ));
  }

  _handleDatePicker() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null && date != _date) {
      setState(() {
        _date = date;
      });
      _dateController.text = _dateFormat.format(_date);
    }
  }

  
  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      TransactionModel transactionModel = TransactionModel(name: _name, time: _date, moneyTotal: _moneyTotal, note:_note, transactionGroupId: _transactionGroupId);
      if(widget.transactionModel == null){
      TransactionHelper.instance.insertTransaction(transactionModel);
      } else{
        transactionModel.id = widget.transactionModel.id;
        TransactionHelper.instance.insertTransaction(transactionModel);
      }
      widget.updateList();
      Navigator.pop(context);
    }
  }

  void _delete(){
    TransactionHelper.instance.deleteTransaction(widget.transactionModel.id);
    widget.updateList();
    Navigator.pop(context);
  }
}
