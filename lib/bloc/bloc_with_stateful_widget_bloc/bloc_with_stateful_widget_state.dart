import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BlocWithStatefulWidgetState extends Equatable {
  final String dateTime;

  const BlocWithStatefulWidgetState(this.dateTime);

  BlocWithStatefulWidgetState copyWith({
    String? dateTime,
  }) {
    return BlocWithStatefulWidgetState(
      dateTime ?? this.dateTime,
    );
  }

  @override
  List<Object> get props => <Object>[dateTime, UniqueKey()];
}
