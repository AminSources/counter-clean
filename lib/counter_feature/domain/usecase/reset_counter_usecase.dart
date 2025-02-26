import 'package:counter_clean/counter_feature/domain/entities/counter_entity.dart';
import 'package:counter_clean/counter_feature/domain/repositories/counter_repository.dart';

class ResetCounterUsecase {
  final CounterRepository counterRepository;

  ResetCounterUsecase(this.counterRepository);

  Future<CounterEntity> call() async {
    //? reset counter value
    final counterValue = CounterEntity(counterValue: 0);

    //? save counter value
    await counterRepository.saveCounterValue(counterValue);

    //? return new counter value
    return counterValue;
  }
}
