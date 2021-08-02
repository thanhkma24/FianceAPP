import 'package:example/constant/color.dart';
import 'package:example/data/helpers/category_expense_handle.dart';
import 'package:flutter/material.dart';

class ExpenseWidget extends StatelessWidget {
  CategoryExpenseHandler expenseHandler = CategoryExpenseHandler();
  String? title;


  ExpenseWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           ListView.builder(
      itemCount: expenseHandler.categoryExpenseList.length,
          itemBuilder: (context, index) {
            // final item = items[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
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
                        expenseHandler.categoryExpenseList[index].titleExpense,
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
          title==null? Positioned(
            bottom: 12 ,
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
