// Extentsion function.
extension NumberParsing on String {
  String parseDouble(int decimal) {
    return double.parse(this).toStringAsFixed(decimal);
  }

  int parseInt() {
    return int.parse(this);
  }
}
