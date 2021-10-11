import 'package:scoped_model/scoped_model.dart';

class DonationModel extends Model {
  int _count = 1;
  bool _donatePressed = false;
  var _textMsg = '';

  get count => _count;
  get donatePressed => _donatePressed;
  get textMsg => _textMsg;

  set donatepressed(bool donate) {
    if (donate == null) {
      throw ArgumentError();
    }
    _donatePressed = donate;
    notifyListeners();
  }

  set textmsg(newText) {
    _textMsg = newText;
    print(_textMsg);
    print(newText);
  }

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    if (count > 1) {
      _count--;
    }
    notifyListeners();
  }
}
