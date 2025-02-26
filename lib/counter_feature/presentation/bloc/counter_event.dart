part of 'counter_bloc.dart';

abstract class CounterEvent {}

class IncreasementCounterEvent extends CounterEvent {}

class DecreasementCounterEvent extends CounterEvent {}

class ResetCounterEvent extends CounterEvent {}
