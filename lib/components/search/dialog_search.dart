import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:localizations/generated/l10n.dart';

class DialogSearch extends StatelessWidget {
   DialogSearch({Key? key, required this.dateSelected, required this.onUpdateSelected}) : super(key: key);

   //int index;
   DateTime dateSelected;
   Function(DateTime) onUpdateSelected;

   bool _selectedDateEnable(DateTime day){
     if((day.isAfter(DateTime.now().subtract(Duration(days: 30))))&&(day.isBefore(DateTime.now().add(Duration(days: 30))))){
       return true;
     }
     return false;
   }


   _selectedDate(BuildContext context) async{
     final DateTime? datepiker = await showDatePicker(
         context: context,
         initialDate: dateSelected,
         firstDate: DateTime(2021),
         lastDate: DateTime(2022),
         selectableDayPredicate: _selectedDateEnable,
       helpText: Translate.of(context).selectedDay
     );
     if(datepiker!=null&&datepiker!=dateSelected){
       onUpdateSelected(datepiker);
     }
     Navigator.pop(context);

   }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all( 10),
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(onPressed: ()=>_selectedDate(context),
            child: Text(
            Translate.of(context).day, style: TextStyle(fontSize: 14, color: Color(0xFF403F4C)), textAlign: TextAlign.center,
          ),
            style: TextButton.styleFrom(backgroundColor: Colors.transparent),
          ),
          Divider(
            color: Colors.black,
          ),
          TextButton(onPressed: null, child: Text(
            Translate.of(context).month, style: TextStyle(fontSize: 14, color: Color(0xFF403F4C)), textAlign: TextAlign.center,
          ),
            style: TextButton.styleFrom(backgroundColor: Colors.transparent),
          ),
          Divider(
            color: Colors.black,
          ),
          TextButton(onPressed: null, child: Text(
            Translate.of(context).distance_time, style: TextStyle(fontSize: 14, color: Color(0xFF403F4C)), textAlign: TextAlign.center,
          ),
            style: TextButton.styleFrom(backgroundColor: Colors.transparent),
          )
        ],
      ),
    );
  }
}
