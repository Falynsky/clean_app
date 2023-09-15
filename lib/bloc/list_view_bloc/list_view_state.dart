import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class TransactionsState extends Equatable {
  final Key key;

  TransactionsState({Key? key})
      : key = key ?? UniqueKey(),
        super();

  @override
  List<Object?> get props => <Object?>[key];
}

class TransactionsInitial extends TransactionsState {}

class TransactionsLoadedState extends TransactionsState {
  TransactionsLoadedState({Key? key}) : super(key: key);

  @override
  List<Object> get props => <Object>[key];
}
