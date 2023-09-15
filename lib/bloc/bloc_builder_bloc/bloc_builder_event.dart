import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BlocListenerEvent extends Equatable {
  const BlocListenerEvent();

  @override
  List<Object> get props => <Object>[UniqueKey()];
}

class InitBlocBuilder extends BlocListenerEvent {}

class StartTimer extends BlocListenerEvent {}

class StopTimer extends BlocListenerEvent {}

class ResetTimer extends BlocListenerEvent {}
