import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BlocWithStatefulWidgetEvent extends Equatable {
  const BlocWithStatefulWidgetEvent();

  @override
  List<Object> get props => <Object>[UniqueKey()];
}

class GetCurrentDate extends BlocWithStatefulWidgetEvent {}
