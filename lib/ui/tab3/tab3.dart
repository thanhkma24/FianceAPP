import 'package:example/ui/tab3/tab3_detail.dart';
import 'package:flutter/material.dart';

// File Tab3
// @project example
// @author hoangminhk4b on 16-07-2021
class Tab3 extends StatefulWidget {
  @override
  _Tab3State createState() => _Tab3State();
}

class _Tab3State extends State<Tab3> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Tab3Detail()));
      },
        child: Text("Tab3")
    )));
  }
}
