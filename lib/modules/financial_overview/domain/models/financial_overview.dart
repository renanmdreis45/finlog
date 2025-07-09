import 'package:finlog/core/enums/speding_category.dart';
import 'package:finlog/core/enums/time_period.dart';
import 'package:finlog/modules/financial_overview/domain/models/spending_breakdown.dart';

import 'net_income.dart';

class FinancialOverview {
  final TimePeriod selectedTimePeriod;
  final NetIncome netIncome;
  final SpendingBreakdown spendingBreakdown;
  final SpendingCategory selectedCategory;

  FinancialOverview({
    required this.selectedTimePeriod,
    required this.netIncome,
    required this.spendingBreakdown,
    required this.selectedCategory,
  });
}
