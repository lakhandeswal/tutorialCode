import 'dart:async';

enum CounterAction {
  Increment,
  Decrement,
  Reset
}

class CounterBloc{
  int counter;

  final _counterController = StreamController<int>();
  StreamSink<int> get counterSink => _counterController.sink;
  Stream<int> get counterStream => _counterController.stream;

  final _eventController = StreamController<CounterAction>();
  StreamSink<CounterAction> get eventSink => _eventController.sink;
  Stream<CounterAction> get eventStream => _eventController.stream;

  CounterBloc(){
    counter = 0;

    eventStream.listen((event){
      if(event == CounterAction.Increment) counter++;
      if(event == CounterAction.Decrement) counter--;
      if(event == CounterAction.Reset) counter = 0;
    });

    counterSink.add(counter);
}

  void dispose(){
    _counterController.close();
    _eventController.close();
}

}
