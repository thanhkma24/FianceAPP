import 'package:example/ui/tab2/tab2_detail.dart';
import 'package:flutter/material.dart';

// File Tab2
// @project example
// @author hoangminhk4b on 16-07-2021
class Tab2 extends StatefulWidget {
  @override
  _Tab2State createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Tab2Detail()));
        },
        child: Text("Tab2")
    )));
  }
}