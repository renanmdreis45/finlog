import 'package:finlog/modules/transactions/presentation/widgets/amount_field.dart';
import 'package:finlog/modules/transactions/presentation/widgets/category_field.dart';
import 'package:finlog/modules/transactions/presentation/widgets/date_field.dart';
import 'package:finlog/modules/transactions/presentation/widgets/description_field.dart';
import 'package:finlog/modules/transactions/presentation/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/transaction_category.dart';
import '../../domain/entities/transaction.dart';
import '../bloc/transaction_bloc.dart';
import '../bloc/transaction_event.dart';

class TransactionForm extends StatefulWidget {
  final bool isExpense;
  final bool isEditing;
  final Transaction? initialData;

  const TransactionForm({
    super.key,
    required this.isExpense,
    this.isEditing = false,
    this.initialData,
  });

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _amountController;
  late TextEditingController _descriptionController;
  late DateTime _selectedDate;
  String _selectedCategory = TransactionCategory.food.displayName;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController(
      text: widget.initialData?.amount.toString() ?? '',
    );
    _descriptionController = TextEditingController(
      text: widget.initialData?.description ?? '',
    );
    _selectedDate = widget.initialData?.date ?? DateTime.now();
    _selectedCategory =
        widget.initialData?.category ?? TransactionCategory.food.displayName;
  }

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.isEditing ? 'Edit' : 'New'} ${widget.isExpense ? 'Expense' : 'Income'}',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AmountField(controller: _amountController),
                const SizedBox(height: 16),
                DescriptionField(
                  descriptionController: _descriptionController,
                ),
                const SizedBox(height: 16),
                CategoryField(
                  selectedCategory: _selectedCategory,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _selectedCategory = value);
                    }
                  },
                ),
                const SizedBox(height: 16),
                DateField(
                  selectedDate: _selectedDate,
                  onDateChanged: (date) => setState(() => _selectedDate = date),
                ),
                const SizedBox(height: 32),
                SubmitButton(
                  onPressed: _submitForm,
                  text: widget.isEditing ? 'Update' : 'Save',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final transaction = Transaction(
        id: widget.initialData?.id ?? DateTime.now().toString(),
        amount: double.parse(_amountController.text),
        description: _descriptionController.text,
        category: _selectedCategory,
        date: _selectedDate,
        isExpense: widget.isExpense,
      );

      if (widget.isEditing) {
        context.read<TransactionBloc>().add(
              UpdateTransactionEvent(transaction: transaction),
            );
      } else {
        context.read<TransactionBloc>().add(
              AddTransactionEvent(transaction: transaction),
            );
      }

      Navigator.pop(context);
    }
  }
}
