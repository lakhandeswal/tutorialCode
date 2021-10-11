import 'package:flutter/material.dart';

class DismissibleListWid extends StatefulWidget {
  @override
  _DismissibleListWidState createState() => _DismissibleListWidState();
}

class _DismissibleListWidState extends State<DismissibleListWid> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    var numi = 0;
    int numinow;

    return Scaffold(
      body: ListViewBuilderdismiss(items: items),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Add New List'),
                  content: Container(
                    height: MediaQuery.of(context).size.height - 60.0,
                    width: MediaQuery.of(context).size.width - 40.0,
                    child: ListView(
                      children: [
                        TextField(
                          controller: textEditingController,
                          maxLength: 20,
                          decoration: InputDecoration(
                            labelText: 'Title',
                            hintText: 'Enter List Title',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    FlatButton(
                      color: ThemeData.dark().accentColor,
                      child: Text(
                        'Add',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        setState(() {
                          numi++;
                          numinow = numi;
                          numi = numinow++;
                          items.add(
                              '${textEditingController.text.toString()} $numi');
                        });
                        print('$numi $numinow');
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              });
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: ThemeData.dark().accentColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {})
          ],
        ),
      ),
    );
  }

  final items = List.generate(12, (i) => 'Items ${i + 1}');
}

class ListViewBuilderdismiss extends StatefulWidget {
  const ListViewBuilderdismiss({
    Key key,
    @required this.items,
  }) : super(key: key);

  final List<String> items;

  @override
  _ListViewBuilderdismissState createState() => _ListViewBuilderdismissState();
}

class _ListViewBuilderdismissState extends State<ListViewBuilderdismiss> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              return Dismissible(
                  key: Key("$index + 1"),
                  background: Container(
                    color: Colors.amber[900],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(Icons.delete),
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.archive,
                            ))
                      ],
                    ),
                  ),
                  onDismissed: (direction) {
                    widget.items.removeAt(index);
                    if (direction == DismissDirection.startToEnd) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content:
                            Text('You deleted Item ${index + 1} start to end'),
                        action: SnackBarAction(label: 'OK', onPressed: () {}),
                      ));
                    } else if (direction == DismissDirection.endToStart) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'You archieved Item ${index + 1} end to start'),
                        action: SnackBarAction(label: 'OK', onPressed: () {}),
                      ));
                    }
                  },
                  child: ListTile(
                    title: Text('${widget.items[index]}'),
                    trailing: Icon(Icons.swipe),
                  ));
            }),
      ],
    );
  }
}

// class AddAlertDialog extends StatefulWidget {
//   AddAlertDialog({Key key}) : super(key: key);

//   @override
//   _AddAlertDialogState createState() => _AddAlertDialogState();
// }

// class _AddAlertDialogState extends State<AddAlertDialog> {
//   @override
//   Widget build(BuildContext context) {
//     return;
//   }
// }
