import 'package:example/model/transaction.dart';
import 'package:flutter/material.dart';

class ItemTracsac extends StatelessWidget {
  const ItemTracsac({Key? key, required this.transaction}) : super(key: key);
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Color(0xFFBFD3C1))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.insert_emoticon, size: 20, color: Color(0xFF5398BE),),
          SizedBox(width: 5,),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(transaction.name, style: TextStyle(fontSize: 18, color: Color(0xFF0D1F2D,), fontWeight: FontWeight.bold)),
              Text(transaction.description, style: TextStyle(fontSize: 14, color: Color(0xFF0D1F2D)),)
            ],
          )),
          Text(transaction.amount, style: TextStyle(fontSize: 16, color: Color(0xFF52050A), fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
