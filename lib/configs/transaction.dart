import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required int id,
    required String name,
    required double amount,
    required String dateTime,
    required String transactionInfo,
    required int userId,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, Object?> json)
      => _$TransactionFromJson(json);
}