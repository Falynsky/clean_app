import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BlocListenerState extends Equatable {
  final int counter;
  final bool isTimerActive;
  const BlocListenerState(this.counter, this.isTimerActive);

  BlocListenerState copyWith({
    int? counter,
    bool? isTimerActive,
  }) {
    return BlocListenerState(
      counter ?? this.counter,
      isTimerActive ?? this.isTimerActive,
    );
  }

  @override
  List<Object> get props => <Object>[counter, isTimerActive, UniqueKey()];
}
