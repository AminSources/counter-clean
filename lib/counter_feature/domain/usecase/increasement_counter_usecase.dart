import 'package:counter_clean/counter_feature/domain/entities/counter_entity.dart';
import 'package:counter_clean/counter_feature/domain/repositories/counter_repository.dart';

class IncreasementCounterUsecase {
  final CounterRepository counterRepository;

  IncreasementCounterUsecase(this.counterRepository);

  Future<CounterEntity> call() async {
    //? get counter value
    final counterCurrentValue = await counterRepository.getCounterValue();

    //? increment counter value
    final newCounterValue = CounterEntity(
      counterValue: counterCurrentValue.counterValue + 1,
    );

    //? save counter value
    await counterRepository.saveCounterValue(newCounterValue);

    //? return new counter value
    return newCounterValue;
  }
}
