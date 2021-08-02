import 'package:example/bloc/search/search_bloc.dart';
import 'package:example/bloc/search/search_event.dart';
import 'package:example/bloc/search/search_state.dart';
import 'package:example/components/search/dialog_search.dart';
import 'package:example/components/search/item_transac.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:localizations/generated/l10n.dart';

class SearchTransaction extends StatefulWidget {
  const SearchTransaction({Key? key}) : super(key: key);

  @override
  _SearchTransactionState createState() => _SearchTransactionState();
}

class _SearchTransactionState extends State<SearchTransaction> {
  DateTime now = DateTime.now();
  int index = 1;
  final blocSearch = SearchBloc();
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _searchController.addListener(() {
    //   blocSearch.eventController.sink.add(SearchEventIpl(_searchController.text));
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    blocSearch.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7E7E7),
      body: StreamBuilder<SearchState>(
        stream: blocSearch.stateController.stream,
        initialData: blocSearch.listResutl,
        builder: (BuildContext context, AsyncSnapshot<SearchState> snapshot) {
          return Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFF403F4C),
                      size: 15,
                    ),
                    iconSize: 15,
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Text(
                    Translate.of(context).search,
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xFF403F4C),
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.date_range, size: 15, color: Color(0xFFFF7141)),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      DateFormat('yyyy-MM-dd').format(now),
                      style: TextStyle(fontSize: 12, color: Color(0xFFFF7141)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 15,
                      color: Color(0xFF403F4C),
                    )
                  ],
                ),
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) => DialogSearch(
                          dateSelected: now,
                          onUpdateSelected: (d) {
                            setState(() {
                              now = d;
                            });
                          },
                        )),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.search,
                      color: Color(0xFFFF7141),
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                      onTap: () {
                        _searchController.addListener(() {
                          blocSearch.eventController.sink
                              .add(SearchEventIpl(_searchController.text));
                        });
                      },
                      controller: _searchController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 5),
                        hintStyle: TextStyle(
                          fontSize: 10,
                          color: Colors.black26,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                      ),
                    ))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    child: Text(
                      Translate.of(context).all,
                      style: TextStyle(
                          fontSize: 10,
                          color: index == 1 ? Colors.white : Color(0xFFFF7141)),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor:
                            index == 1 ? Color(0xFFFF7141) : Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                  ),
                  TextButton(
                    onPressed: () {
                      index = 2;
                      setState(() {});
                    },
                    child: Text(
                      Translate.of(context).thuchi,
                      style: TextStyle(
                          fontSize: 10,
                          color: index == 2 ? Colors.white : Color(0xFFFF7141)),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor:
                            index == 2 ? Color(0xFFFF7141) : Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                  ),
                  TextButton(
                    onPressed: () {
                      index = 3;
                      setState(() {});
                    },
                    child: Text(
                      Translate.of(context).vay,
                      style: TextStyle(
                          fontSize: 10,
                          color: index == 3 ? Colors.white : Color(0xFFFF7141)),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor:
                            index == 3 ? Color(0xFFFF7141) : Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        index = 4;
                      });
                    },
                    child: Text(
                      Translate.of(context).plan,
                      style: TextStyle(
                          fontSize: 10,
                          color: index == 4 ? Colors.white : Color(0xFFFF7141)),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor:
                            index == 4 ? Color(0xFFFF7141) : Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                  ),
                ],
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: ListView.builder(
                    itemCount: snapshot.data!.listTransac.length,
                    itemBuilder: (context, position) {
                      return ItemTracsac(
                          transaction: snapshot.data!.listTransac[position]);
                    }),
              ))
            ],
          );
        },
        // child: Column(
        //   children: [
        //     SizedBox(height: 20,),
        //     Row(
        //       children: [
        //         SizedBox(width: 10,),
        //         IconButton(onPressed: ()=> Navigator.of(context).pop(),
        //             icon: Icon(Icons.arrow_back_ios, color: Color(0xFF403F4C), size: 15,),
        //           iconSize: 15,
        //         ),
        //         SizedBox(
        //           width: 70,
        //         ),
        //         Text(
        //           Translate.of(context).search, style: TextStyle(fontSize: 25, color: Color(0xFF403F4C), fontWeight: FontWeight.w600),
        //         )
        //       ],
        //     ),
        //     TextButton(
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Icon(Icons.date_range, size: 15,color: Color(0xFFFF7141)),
        //           SizedBox(width: 5,),
        //           Text(DateFormat('yyyy-MM-dd').format(now), style: TextStyle(fontSize: 12, color: Color(0xFFFF7141)),),
        //           SizedBox(width: 5,),
        //           Icon(Icons.arrow_drop_down, size: 15,color: Color(0xFF403F4C),)
        //         ],
        //       ),
        //       onPressed: ()=>showDialog(context: context, builder: (context)=>DialogSearch(dateSelected: now, onUpdateSelected: (d ) {
        //         setState(() {
        //           now=d;
        //         });
        //       },)),
        //       style: TextButton.styleFrom(
        //         backgroundColor: Colors.transparent,
        //       ),
        //     ),
        //     Container(
        //       margin: EdgeInsets.symmetric(horizontal: 20),
        //       width: double.infinity,
        //       height: 30,
        //       decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.all(Radius.circular(10))
        //       ),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         //crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           SizedBox(width: 5,),
        //           Icon(Icons.search, color: Color(0xFFFF7141), size: 20,),
        //           SizedBox(width: 10,),
        //           Expanded(child: TextField(
        //             decoration: InputDecoration(
        //               contentPadding: EdgeInsets.only(top: 5),
        //               hintStyle: TextStyle(fontSize: 10, color: Colors.black26,),
        //               enabledBorder: OutlineInputBorder(
        //                   borderSide: BorderSide(
        //                       color: Colors.transparent
        //                   )
        //               ),
        //               focusedBorder: OutlineInputBorder(
        //                   borderSide: BorderSide(
        //                       color: Colors.transparent
        //                   )
        //               ),
        //
        //             ),
        //           ))
        //         ],
        //       ),
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         TextButton(
        //           onPressed: (){setState(() {
        //             index=1;
        //           });},
        //           child: Text(Translate.of(context).all, style: TextStyle(fontSize: 10, color: index==1?Colors.white:Color(0xFFFF7141)),),
        //           style: TextButton.styleFrom(
        //             backgroundColor: index==1?Color(0xFFFF7141):Colors.white,
        //             shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.all(Radius.circular(20))
        //             )
        //           ),
        //         ),
        //         TextButton(
        //           onPressed: (){
        //             index=2;
        //             setState(() {
        //             });
        //           },
        //           child: Text(Translate.of(context).thuchi, style: TextStyle(fontSize: 10, color: index==2?Colors.white:Color(0xFFFF7141)),),
        //           style: TextButton.styleFrom(
        //               backgroundColor: index==2?Color(0xFFFF7141):Colors.white,
        //               shape: RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.all(Radius.circular(20))
        //               )
        //           ),
        //         ),
        //         TextButton(
        //           onPressed: (){
        //             index=3;
        //             setState(() {
        //             });
        //           },
        //           child: Text(Translate.of(context).vay, style: TextStyle(fontSize: 10, color: index==3?Colors.white:Color(0xFFFF7141)),),
        //           style: TextButton.styleFrom(
        //               backgroundColor: index==3?Color(0xFFFF7141):Colors.white,
        //               shape: RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.all(Radius.circular(20))
        //               )
        //           ),
        //         ),
        //         TextButton(
        //           onPressed: (){
        //             setState(() {
        //               index=4;
        //             });
        //           },
        //           child: Text(Translate.of(context).plan, style: TextStyle(fontSize: 10, color: index==4?Colors.white:Color(0xFFFF7141)),),
        //           style: TextButton.styleFrom(
        //               backgroundColor: index==4?Color(0xFFFF7141):Colors.white,
        //               shape: RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.all(Radius.circular(20))
        //               )
        //           ),
        //         ),
        //       ],
        //     ),
        //     Expanded(child: Container(
        //       decoration: BoxDecoration(
        //         color: Colors.white,
        //         borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
        //       ),
        //
        //     )
        //     )
        //   ],
        // ),
      ),
    );
  }
}
