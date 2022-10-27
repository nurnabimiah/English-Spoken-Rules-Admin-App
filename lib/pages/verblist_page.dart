import 'package:english_spoken_rules_admin/pages/verb_insert_page.dart';
import 'package:flutter/material.dart';

class VerbListPage extends StatefulWidget {
  static const String routeName = "/ verb_list_page";


  @override
  State<VerbListPage> createState() => _VerbListPageState();
}

class _VerbListPageState extends State<VerbListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verb List'),),

      body:Container(
        margin: EdgeInsets.symmetric(horizontal: 7.0, vertical: 8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Table(
            //defaultColumnWidth: FixedColumnWidth(120.0),
            border: TableBorder.all(
              color: Colors.black,
              style: BorderStyle.solid,
              width: 1,
            ),

            children: [
              TableRow(
                  children: [
                    TableCell(child: Container(
                      color: Colors.greenAccent,
                      child: Center(
                        child: Text('Name',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ) ,
                    )),

                    TableCell(child: Container(
                      color: Colors.greenAccent,
                      child: Center(
                        child: Text('Email',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ) ,
                    )),

                    TableCell(child: Container(
                      color: Colors.greenAccent,
                      child: Center(
                        child: Text('Name',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ) ,
                    )),

                  ]
              ),

              TableRow(
                  children: [
                    TableCell(child: Center(
                      child: Text('Nurnabi',style: TextStyle(fontSize: 20.0)),
                    )),

                    TableCell(child: Center(
                      child: Text('diunayonahmed@gmail.com',style: TextStyle(fontSize: 20.0)),
                    )),

                    TableCell(child: Center(
                      child: Text('Action hit',style: TextStyle(fontSize: 20.0)),
                    ))
                  ]
              ),

              TableRow(
                  children: [
                    TableCell(child: Center(
                      child: Text('Nurnabi Miah vai',style: TextStyle(fontSize: 20.0)),
                    )),

                    TableCell(child: Center(
                      child: Text('diunayonahmed@gmail.com',style: TextStyle(fontSize: 20.0)),
                    )),

                    TableCell(child: Center(
                      child: Text('Action hit',style: TextStyle(fontSize: 20.0)),
                    )),


                  ]
              ),

              TableRow(
                  children: [
                    TableCell(child: Center(
                      child: Text('Nurnabi Miah vai',style: TextStyle(fontSize: 20.0)),
                    )),

                    TableCell(child: Center(
                      child: Text('diunayonahmed@gmail.com',style: TextStyle(fontSize: 20.0)),
                    )),

                    TableCell(child: Center(
                      child: Text('Action hit',style: TextStyle(fontSize: 20.0)),
                    )),


                  ]
              ),
            ],

          ),
        ),

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_task),
        onPressed: () {
          Navigator.pushNamed(context, VerbInsert.routeName);
        },

      ),
    );
  }
}
