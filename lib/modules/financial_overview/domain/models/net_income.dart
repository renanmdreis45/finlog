class NetIncome {
  final double amount;
  final double monthlyChangePercent;
  final Map<DateTime, double> monthlyHistory;

  NetIncome({
    required this.amount,
    required this.monthlyChangePercent,
    required this.monthlyHistory,
  });

  String get formattedAmount => '\$${amount.toStringAsFixed(2)}';
  String get formattedChange =>
      '${monthlyChangePercent >= 0 ? '+' : ''}${monthlyChangePercent.toStringAsFixed(0)}%';
}
