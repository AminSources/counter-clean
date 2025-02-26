import 'package:bloc/bloc.dart';
import 'package:counter_clean/counter_feature/domain/usecase/decreasement_counter_usecase.dart';
import 'package:counter_clean/counter_feature/domain/usecase/increasement_counter_usecase.dart';
import 'package:counter_clean/counter_feature/domain/usecase/reset_counter_usecase.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final IncreasementCounterUsecase increasementCounterUsecase;
  final DecreasementCounterUsecase decreasementCounterUsecase;
  final ResetCounterUsecase resetCounterUsecase;

  CounterBloc(
    this.increasementCounterUsecase,
    this.decreasementCounterUsecase,
    this.resetCounterUsecase,
  ) : super(CounterState(counterValue: 0)) {
    //? increasement counter event
    on<IncreasementCounterEvent>(_onIncreasementCounter);

    //? decreasement counter event
    on<DecreasementCounterEvent>(_onDecreaseCounter);

    //? reset counter event
    on<ResetCounterEvent>(_onResetCounter);
  }

  //? increasement counter func
  void _onIncreasementCounter(event, emit) async {
    final newCounterValue = await increasementCounterUsecase();
    emit(CounterState(counterValue: newCounterValue.counterValue));
  }

  //? decreasement counter func
  void _onDecreaseCounter(event, emit) async {
    final newCounterValue = await decreasementCounterUsecase();
    emit(CounterState(counterValue: newCounterValue.counterValue));
  }

  //? reset counter func
  void _onResetCounter(event, emit) async {
    final newCounterValue = await resetCounterUsecase();
    emit(CounterState(counterValue: newCounterValue.counterValue));
  }
}
