import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  Category? _selectedFilter;

  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Dev Course',
      amount: 599.00,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Coffee and Pastries',
      amount: 245.50,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Cinema Tickets',
      amount: 380.00,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  List<Expense> get _filteredExpenses {
    if (_selectedFilter == null) {
      return _registeredExpenses;
    }
    return _registeredExpenses
        .where((expense) => expense.category == _selectedFilter)
        .toList();
  }

  double get _totalFilteredAmount {
    double total = 0;
    for (final item in _filteredExpenses) {
      total += item.amount;
    }
    return total;
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    Widget mainContent = const Center(
      child: Text('No expenses found. Tap + to add one!'),
    );

    if (_filteredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _filteredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add_circle_outline_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedFilter == null
                      ? 'Total Spending'
                      : '${_selectedFilter!.name.toUpperCase()} Spending',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
                Text(
                  '₱${_totalFilteredAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ),
          Chart(expenses: _registeredExpenses),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: const Text('All'),
                    selected: _selectedFilter == null,
                    onSelected: (_) {
                      setState(() {
                        _selectedFilter = null;
                      });
                    },
                  ),
                ),
                ...Category.values.map(
                  (category) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      avatar: Icon(categoryIcons[category], size: 16),
                      label: Text(category.name.toUpperCase()),
                      selected: _selectedFilter == category,
                      onSelected: (selected) {
                        setState(() {
                          _selectedFilter = selected ? category : null;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openAddExpenseOverlay,
        icon: const Icon(Icons.add),
        label: const Text('New Expense'),
      ),
    );
  }
}