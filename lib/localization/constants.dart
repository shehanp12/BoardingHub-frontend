import 'package:intl/intl.dart';

class constants{
  static String currencyUnit = "SAR ";


  static String numFormat (double num) {
    var format =new  NumberFormat("###.##", "en_US");
    return format.format(num);
  }
}