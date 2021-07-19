extension DoubleToPrice on double {
  String toPrice() {
    return toStringAsFixed(2).replaceAll('.', ',');
  }
}
