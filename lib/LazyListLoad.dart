import 'package:flutter/material.dart';

class LazyListLoad extends StatefulWidget {
  @override
  _LazyListLoadState createState() => _LazyListLoadState();
}

class _LazyListLoadState extends State<LazyListLoad> {
  List myList;
  int currentMax = 10;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myList = List.generate(10, (index) => 'Item ${index + 1}');
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
         getMoreData();
      }
    });
  }

  getMoreData(){
    for(int i = currentMax; i< currentMax +10;i++){
      myList.add('Items $i');
    }
    currentMax = currentMax + 10;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          controller: _scrollController,
          itemExtent: 80,
          itemCount: myList.length+1,
          itemBuilder: (context,index){
            if(index == myList.length){
              return Center(
                child: Text('Loading...',style: TextStyle(
                    color: Colors.white
                ),),
              );
            }
            return ListTile(
              leading: Text(myList[index]),
            );
      }),
    );
  }
}
