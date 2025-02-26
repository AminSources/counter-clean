import 'package:counter_clean/counter_feature/domain/entities/counter_entity.dart';
import 'package:counter_clean/counter_feature/domain/repositories/counter_repository.dart';

class CounterRepositoryImpl extends CounterRepository {
  //* counter default value
  int counterValue = 0;

  //? get counter value
  @override
  Future<CounterEntity> getCounterValue() async {
    return CounterEntity(counterValue: counterValue);
  }

  //? save counter value
  @override
  Future<void> saveCounterValue(CounterEntity counterEntity) async {
    counterValue = counterEntity.counterValue;
  }
}
