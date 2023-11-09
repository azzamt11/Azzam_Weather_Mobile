class Helper {

  bool isNumeric(String s) {
    bool value= true;
    try{
      double number= double.parse(s);
    } catch(e) {
      value= false;
    }
    return value;
  }
}