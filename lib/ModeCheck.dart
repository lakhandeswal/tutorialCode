class Util{
  static String mode = 'release';
  static String url = 'https://www.google.com';

  static bool get debugMode{
    var debug = false;
    assert(debug = true);
    return debug;
  }

  static checkDebugMode(){
    assert((){
      mode = 'debug';
      url = 'https://www.debug.com';
      return true;
    }());
  }
}
