import 'package:flutter/material.dart';
import 'counterBloc.dart';

class IncrementBloc extends StatefulWidget {
  @override
  _IncrementBlocState createState() => _IncrementBlocState();
}

class _IncrementBlocState extends State<IncrementBloc> {
  final counterBloc = CounterBloc();

  @override
  void dispose() {
    counterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:StreamBuilder( 
          stream: counterBloc.counterStream,
          initialData: 0,
          builder: (context,snapshot){
             //if (snapshot.hasData) {
            return Text('You have pressed the button ${snapshot.data} times');
            // } else{
            //    print('no data');
            //  }
          },
        )
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:[
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){
              counterBloc.eventSink.add(CounterAction.Increment);
              print(counterBloc.counter);
              },
          ),
         FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: (){
          counterBloc.eventSink.add(CounterAction.Reset);
          print(counterBloc.counter);
          },
         ),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: (){
              counterBloc.eventSink.add(CounterAction.Decrement);
              print(counterBloc.counter);
            },
          )
        ]
      ),
    );
  }
}
