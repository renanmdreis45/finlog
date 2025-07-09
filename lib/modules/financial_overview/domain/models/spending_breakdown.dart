import 'package:finlog/core/enums/speding_category.dart';

class SpendingBreakdown {
  final double totalAmount;
  final double monthlyChangePercent;
  final Map<SpendingCategory, double> amountsByCategory;

  SpendingBreakdown({
    required this.totalAmount,
    required this.monthlyChangePercent,
    required this.amountsByCategory,
  });

  String get formattedTotalAmount => '\$${totalAmount.toStringAsFixed(2)}';
  String get formattedChange =>
      '${monthlyChangePercent >= 0 ? '+' : ''}${monthlyChangePercent.toStringAsFixed(0)}%';
}
