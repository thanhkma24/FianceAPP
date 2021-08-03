import 'package:example/constant/color.dart';
import 'package:example/data/model/transaction_group_model.dart';
import 'package:flutter/material.dart';

class ExpenseWidget extends StatelessWidget {
  String? title;
  final List<TransactionGroupModel> list;

  ExpenseWidget({this.title, required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                // final item = items[index];
                TransactionGroupModel? model;
                print('xxxxxx${list[index].name}');
                if (list[index].transactionTypeName.trim() == 'thu') {
                  model = list[index];
                }
                if (model != null) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.home_outlined),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              model.name,
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              }),
          title == null
              ? Positioned(
                  bottom: 12,
                  right: 12,
                  child: FloatingActionButton(
                    backgroundColor: primaryColor,
                    onPressed: () {
                      // _showMaterialDialog('Thêm mới danh mục','title',);
                    },
                    child: Icon(
                      Icons.add,
                      size: 25,
                color: Colors.white,
              ),
            ),
          ):Container()
        ],
      ),

    );
  }
}
