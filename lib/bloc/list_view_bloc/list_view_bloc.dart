import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unclean_app/bloc/list_view_bloc/list_view_event.dart';
import 'package:unclean_app/bloc/list_view_bloc/list_view_state.dart';
import 'package:unclean_app/configs/transaction.dart';
import 'package:unclean_app/http/services/transactions/transaction_service.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final List<Transaction> _transactions = <Transaction>[];

  List<Transaction> get transactions => _transactions;

  TransactionsBloc() : super(TransactionsInitial()) {
    on<LoadTransactionsEvent>(_loadTransactions);
  }

  Future<void> _loadTransactions(
    TransactionsEvent event,
    Emitter<TransactionsState> emit,
  ) async {
    _transactions.clear();
    final List<Transaction> transactions = TransactionService().fetchTransactions(1000);
    _transactions.addAll(transactions);
    emit(TransactionsLoadedState());
  }
}
