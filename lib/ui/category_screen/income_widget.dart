import 'package:example/constant/color.dart';
import 'package:example/data/helpers/category_income_handle.dart';
import 'package:example/data/helpers/transaction_group.dart';
import 'package:example/data/model/transaction_group_model.dart';
import 'package:example/model/category_income_trans.dart';
import 'package:flutter/material.dart';
import 'package:localizations/generated/l10n.dart';

class IncomeWidget extends StatefulWidget {
  String? title;
  IncomeWidget({this.title});
  @override
  _IncomeWidgetState createState() => _IncomeWidgetState();
}
class _IncomeWidgetState extends State<IncomeWidget> {
  late TransactionGroupHelper transactionGroupHelper;
  List<TransactionGroupModel> listTransGroupIncome = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            ListView.builder(
        itemCount: listTransGroupIncome.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.money),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        listTransGroupIncome[index].name,
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
           widget.title==null? Positioned(
              bottom: 12 ,
              right: 12,
              child: FloatingActionButton(
                backgroundColor: primaryColor,
                onPressed: () {
                  _showMaterialDialog('Thêm mới danh mục','title');
                },
                child: Icon(
                  Icons.add,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ):Container()
          ],
        ));
  }

  Future<void> _showMaterialDialog(
      String title, String name) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text(title)),
            content: TextField(
              controller: TextEditingController(text: name),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(Translate.of(context).hy),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text(Translate.of(context).lu),
                onPressed: (){},
              ),
            ],
          );
        });
  }
  void addIncome(String title)
  {

  }


}
