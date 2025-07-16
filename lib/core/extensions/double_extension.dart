extension DoubleExtension on double {
  String toBRL() {
    return 'R\$ ${toStringAsFixed(2).replaceAll('.', ',')}';
  }
}
