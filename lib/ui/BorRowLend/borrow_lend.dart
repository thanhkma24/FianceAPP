import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:localizations/generated/l10n.dart';
import 'package:example/ui/mobile_home.dart';

class BorRowLend extends StatefulWidget {
  BorRowLend({Key? key}) : super(key: key);

  @override
  _BorRowLend createState() => _BorRowLend();
}

class _BorRowLend extends State<BorRowLend> {
  DateTime date = DateTime.now();
  bool isDate = true;
  _selectedDate(BuildContext context) async {
    final DateTime? datepiker = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (datepiker != null && datepiker != date) {
      setState(() {
        date = datepiker;
        isDate = false;
      });
    }
  }

  _handleOnpressSave(context) {
    Navigator.push(
      (context),
      MaterialPageRoute(builder: (context) => MobileHome()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _translate = Translate.of(context);
    var fullSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(_translate.create_transaction),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color(0xFFFF7141), width: 2))),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Color(0xFFFF7141), fontSize: 20),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Color(0xFFFF8A60)),
                      hintText: "0 đ"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color(0xFFFF7141), width: 2))),
                child: Row(
                  children: [
                    Text(
                        isDate
                            ? _translate.day_trading
                            : DateFormat('dd-MM-yyyy').format(date),
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFFFF7141))),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        _selectedDate(context);
                      },
                      icon: Icon(Icons.date_range),
                      color: Color(0xFFFF7141),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color(0xFFFF7141), width: 2))),
                child: Row(
                  children: [
                    Text(_translate.trading_group,
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFFFF7141))),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        print("Nhóm giao dịch");
                      },
                      icon: Icon(Icons.view_list),
                      color: Color(0xFFFF7141),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10, right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: Color(0xFFFF7141)),
                ),
                child: TextField(
                  maxLines:null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: _translate.note,
                      hintStyle:
                          TextStyle(color: Color(0xFFFF8A60), fontSize: 16)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: fullSize.width,
                height: 40,
                decoration: BoxDecoration(color: Colors.transparent),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFF7141),
                      textStyle: TextStyle(fontSize: 20)),
                  onPressed: () {
                    _handleOnpressSave(context);
                  },
                  child: Text(_translate.save),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
