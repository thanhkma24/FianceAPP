import 'package:example/constant/color.dart';
import 'package:example/data/helpers/category_expense_handle.dart';
import 'package:example/data/helpers/category_income_handle.dart';
import 'package:example/data/helpers/transaction_group.dart';
import 'package:example/data/helpers/transaction_type_helper.dart';
import 'package:example/data/model/transaction_group_model.dart';
import 'package:example/ui/category_screen/expense_widget.dart';
import 'package:example/ui/category_screen/income_widget.dart';
import 'package:flutter/material.dart';
import 'package:localizations/generated/l10n.dart';

class CrudCategoryTrans extends StatefulWidget {
  List<TransactionGroupModel>? list;

  CrudCategoryTrans({this.list});

  @override
  _CrudCategoryTransState createState() => _CrudCategoryTransState();
}

class _CrudCategoryTransState extends State<CrudCategoryTrans>
    with SingleTickerProviderStateMixin {
  late TextEditingController textEditingController;
  TabController? _tabController;
  late CategoryExpenseHandler expenseHandler;
  late CategoryIncomeHandler incomeHandler;
  late TransactionGroupHelper transactionGroupHelper;
  late TransactionTypeHelper transactionTypeHelper;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.1,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios_outlined)),
        centerTitle: true,
        title: Text(Translate.of(context).chnhSaDanhMc),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: primaryColor,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    text: Translate.of(context).chi,
                  ),
                  Tab(
                    text: Translate.of(context).thu,
                  ),
                ],
              ),
            ),
          ),
          // tab bar view here
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [ExpenseWidget(list: widget.list!), IncomeWidget()],
            ),
          ),
        ],
      ),
    );
  }


}
