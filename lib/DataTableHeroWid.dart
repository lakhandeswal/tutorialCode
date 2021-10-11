import 'package:flutter/material.dart';
import 'clipPathClipper.dart';

class DataTableWid extends StatefulWidget {
  DataTableWid({Key key}) : super(key: key);

  @override
  _DataTableWidState createState() => _DataTableWidState();
}

class _DataTableWidState extends State<DataTableWid> {
  var keyVal = 'killingit';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          DataTable(
              dataRowHeight: 100.0,
              dividerThickness: 10.0,
              columns: <DataColumn>[
                DataColumn(label: Text('No.')),
                DataColumn(label: Text('Name'))
              ],
              rows: <DataRow>[
                DataRow(cells: [
                  DataCell(
                    ListTile(
                      title: Text('1'),
                    ),
                  ),
                  DataCell(ListTile(
                    title: Text('Lakhan'),
                  ))
                ]),
                DataRow(cells: [
                  DataCell(ListTile(
                    title: Text('2'),
                  )),
                  DataCell(ListTile(
                    title: Text('Deswal'),
                  ))
                ])
              ]),
          Hero(
              tag: keyVal,
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                child: IconButton(
                  color: Colors.cyanAccent,
                  icon: Icon(Icons.grid_view),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Hero(
                          tag: keyVal,
                          child: Scaffold(
                              appBar: AppBar(
                                title: Text('Return {Hero Wid}'),
                              ),
                              body: ClipPathWid()),
                        );
                      }),
                    );
                  },
                ),
              ))
        ],
      ),
    );
  }
}
