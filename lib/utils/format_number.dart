import 'package:intl/intl.dart';

String formatReais(double value){
  final rs = NumberFormat.currency(locale: "pt_BR", symbol: "R\$", name: "Real");
  return rs.format(value);
}

String formatDouble(double value){
  final rs = NumberFormat.currency(locale: "pt_BR", symbol: "", name: "Real");
  return rs.format(value);
}