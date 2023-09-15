import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BlocBuilderEvent extends Equatable {
  const BlocBuilderEvent();

  @override
  List<Object> get props => <Object>[UniqueKey()];
}

class InitBlocBuilder extends BlocBuilderEvent {}
class StartTimer extends BlocBuilderEvent {}
class StopTimer extends BlocBuilderEvent {}
class ResetTimer extends BlocBuilderEvent {}