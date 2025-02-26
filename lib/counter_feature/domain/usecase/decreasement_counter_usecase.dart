import 'package:counter_clean/counter_feature/domain/entities/counter_entity.dart';
import 'package:counter_clean/counter_feature/domain/repositories/counter_repository.dart';

class DecreasementCounterUsecase {
  final CounterRepository counterRepository;

  DecreasementCounterUsecase(this.counterRepository);

  Future<CounterEntity> call() async {
    //? get counter value
    final counterCurrentValue = await counterRepository.getCounterValue();

    //? decrement counter value
    final newCounterValue = CounterEntity(
      counterValue: counterCurrentValue.counterValue - 1,
    );

    //? save counter value
    await counterRepository.saveCounterValue(newCounterValue);

    //? return new counter value
    return newCounterValue;
  }
}
