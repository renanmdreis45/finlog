enum TransactionCategory {
  food('Food'),
  transport('Transport'),
  shopping('Shopping'),
  bills('Bills'),
  entertainment('Entertainment'),
  others('Others');

  const TransactionCategory(this.displayName);

  final String displayName;

  static List<String> get displayValues => TransactionCategory.values
      .map((category) => category.displayName)
      .toList();

  static TransactionCategory fromString(String value) {
    return TransactionCategory.values.firstWhere(
      (category) => category.displayName == value,
      orElse: () => TransactionCategory.others,
    );
  }
}
