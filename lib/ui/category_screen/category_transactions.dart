import 'package:common/auth/auth.dart';
import 'package:example/constant/color.dart';
import 'package:example/data/helpers/category_expense_handle.dart';
import 'package:example/ui/category_screen/bloc/category_bloc.dart';
import 'package:example/ui/category_screen/crud_category_trans.dart';
import 'package:example/ui/category_screen/expense_widget.dart';
import 'package:example/ui/category_screen/income_widget.dart';
import 'package:flutter/material.dart';
import 'package:localizations/generated/l10n.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    {
  late TabController _tabController;
  late CategoryExpenseHandler expenseHandler;
  late CategoryBloc _categoryBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _categoryBloc = context.read();
    _categoryBloc.add(CategoryGetAllEvent());
    // _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(
        listener: (context, state) {
      print('###$state');
    }, builder: (context, state) {
      if (state is CategoryLoading) {
        return Scaffold(
          body: Center(
            child: LinearProgressIndicator(),
          ),
        );
      } else if (state is CategoryLoaded) {
        // return Scaffold(
        //   appBar: AppBar(
        //     backgroundColor: primaryColor,
        //     elevation: 0.1,
        //     leading: InkWell(
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //         child: Icon(
        //           Icons.arrow_back_ios_outlined,
        //           color: Colors.white,
        //           size: 20,
        //         )),
        //     centerTitle: true,
        //     title: Text(
        //       Translate.of(context).chnDanhMc,
        //       style: TextStyle(color: Colors.white),
        //     ),
        //     actions: [
        //       Padding(
        //         padding: const EdgeInsets.only(right: 15),
        //         child: InkWell(
        //           child: Icon(Icons.edit),
        //           onTap: () {
        //             Navigator.of(context).push(
        //                 MaterialPageRoute(builder: (_) => CrudCategoryTrans()));
        //           },
        //         ),
        //       )
        //     ],
        //   ),
        //   body: Column(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
        //         child: Container(
        //           height: 45,
        //           decoration: BoxDecoration(
        //             color: Colors.grey[300],
        //             borderRadius: BorderRadius.circular(
        //               20.0,
        //             ),
        //           ),
        //           child: TabBar(
        //             controller: _tabController,
        //             indicator: BoxDecoration(
        //               borderRadius: BorderRadius.circular(
        //                 25.0,
        //               ),
        //               color: primaryColor,
        //             ),
        //             labelColor: Colors.white,
        //             unselectedLabelColor: Colors.black,
        //             tabs: [
        //               Tab(
        //                 text: Translate.of(context).chi,
        //               ),
        //               Tab(
        //                 text: Translate.of(context).thu,
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //       // tab bar view here
        //       Expanded(
        //         child: TabBarView(
        //           controller: _tabController,
        //           children: [
        //             ExpenseWidget(
        //               title: 'Chi',
        //             ),
        //             IncomeWidget(
        //               title: 'Thu',
        //             )
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // );
        return Text('xxxx');
      } else if (state is CategoryError) {
        return Scaffold(
          body: Center(
            child: Text(state.error),
          ),
        );
      }
    else {
        return Scaffold(
          body: Center(
            child: Text('có lỗi khi lấy dữ liệu'),
          ),
        );
      }

    });
  }
}
