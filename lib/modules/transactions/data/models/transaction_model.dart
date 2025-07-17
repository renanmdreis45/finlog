import '../../domain/entities/transaction.dart';

class TransactionModel extends Transaction {
  const TransactionModel({
    required String id,
    required double amount,
    required String description,
    required String category,
    required DateTime date,
    required bool isExpense,
  }) : super(
          id: id,
          amount: amount,
          description: description,
          category: category,
          date: date,
          isExpense: isExpense,
        );

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] as String,
      amount: json['amount'] as double,
      description: json['description'] as String,
      category: json['category'] as String,
      date: DateTime.parse(json['date'] as String),
      isExpense: json['isExpense'] as bool,
    );
  }

  factory TransactionModel.fromEntity(Transaction transaction) {
    return TransactionModel(
      id: transaction.id,
      amount: transaction.amount,
      description: transaction.description,
      category: transaction.category,
      date: transaction.date,
      isExpense: transaction.isExpense,
    );
  }
}
