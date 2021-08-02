import 'package:example/ui/tab1/search_transaction/search_transac_detail.dart';
import 'package:example/ui/tab1/tab1_detail.dart';
import 'package:example/model/transaction.dart';
import 'package:example/ui/tab1/fake_data.dart';
import 'package:flutter/material.dart';
import 'package:localizations/generated/l10n.dart';

// File Tab1
// @project example
// @author hoangminhk4b on 16-07-2021
class Tab1 extends StatefulWidget {
  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  String _totalAmount = '6,760,000đ';
  int _currentTabClick = 1;
  int _currentDetailClick = 1;
  String _customerName = 'ADMIN';

  @override
  Widget build(BuildContext context) {
    final _listTitles = [
      {'value': 1, 'label': Translate.of(context).day},
      {'value': 2, 'label': Translate.of(context).week},
      {'value': 3, 'label': Translate.of(context).month}
    ];
    final _listBtnDetails = [
      {'value': 1, 'label': Translate.of(context).all},
      {'value': 2, 'label': Translate.of(context).outcome},
      {'value': 3, 'label': Translate.of(context).fee}
    ];

    Widget _renderTabItem(
        {required Map<dynamic, dynamic> title,
          bool isLeft = true,
          bool border = false,
          double borderRadius = 50}) {
      final _borderRadius = isLeft
          ? BorderRadius.only(
        topLeft: Radius.circular(borderRadius),
        bottomLeft: Radius.circular(borderRadius),
      )
          : BorderRadius.only(
        topRight: Radius.circular(borderRadius),
        bottomRight: Radius.circular(borderRadius),
      );

      return Expanded(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _currentTabClick = title['value'];
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: border ? _borderRadius : null,
              color:
              _currentTabClick == title['value'] ? Color(0xFFFF8A63) : null,
            ),
            child: Text(
              title['label'],
              style: TextStyle(
                fontSize: 14,
                color: _currentTabClick != title['value']
                    ? Color(0xFFFF8A63)
                    : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            alignment: Alignment.center,
          ),
        ),
      );
    }

    Widget _renderDetailBtn({required Map<dynamic, dynamic> title}) {
      return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                _currentDetailClick == title['value']
                    ? Color(0xFFFF8A63)
                    : Colors.white),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
            )),
        onPressed: () {
          setState(() {
            _currentDetailClick = title['value'];
          });
        },
        child: Text(
          title['label'],
          style: TextStyle(
              color: _currentDetailClick != title['value']
                  ? Color(0xFFFF8A63)
                  : Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
      );
    }

    Widget _renderTransactionItem({required Transaction trans}) {
      return GestureDetector(
        onTap: () {
          print('tap ${trans.toString()}');
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 43, vertical: 3),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.05),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              Image(image: AssetImage('assets/icon/wallet.png')),
              Padding(padding: EdgeInsets.only(right: 9)),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trans.name,
                    style: TextStyle(
                      color: Color(0xFF707070),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    trans.description,
                    style: TextStyle(
                      color: Color(0xFF707070),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                trans.amount,
                style: TextStyle(
                  color: Color(0xFFE44B7A),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xFFE0E1E9),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 20)),
                Text(
                  '${Translate.of(context).welcome}, $_customerName',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF707070)),
                ),
                Spacer(),
                IconButton(
                  iconSize: 30,
                  color: Color(0xFFFF7141),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchTransaction()));
                  },
                  icon: Icon(Icons.search),
                ),
                Padding(padding: EdgeInsets.only(right: 20)),
              ],
            ),
            Padding(padding: const EdgeInsets.only(top: 12)),
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                Translate.of(context).wallet,
                style: TextStyle(
                  color: Color(0xFF9E9E9E),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                _totalAmount,
                style: TextStyle(
                  color: Color(0xFF707070),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.only(top: 35)),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(padding: const EdgeInsets.only(top: 16)),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 44),
                      width: MediaQuery.of(context).size.width,
                      height: 32,
                      decoration: BoxDecoration(
                          color: Color(0xFFEFEFEF),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Row(
                        children: [
                          _renderTabItem(title: _listTitles[0], border: true),
                          _renderTabItem(title: _listTitles[1]),
                          _renderTabItem(
                            title: _listTitles[2],
                            border: true,
                            isLeft: false,
                          )
                        ],
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(top: 35)),
                    Row(
                      children: [
                        Padding(padding: const EdgeInsets.only(left: 43)),
                        _renderDetailBtn(title: _listBtnDetails[0]),
                        Padding(padding: const EdgeInsets.only(left: 12)),
                        _renderDetailBtn(title: _listBtnDetails[1]),
                        Padding(padding: const EdgeInsets.only(left: 12)),
                        _renderDetailBtn(title: _listBtnDetails[2])
                      ],
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return _renderTransactionItem(
                                trans: transactionData[index]);
                          },
                          itemCount: transactionData.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
