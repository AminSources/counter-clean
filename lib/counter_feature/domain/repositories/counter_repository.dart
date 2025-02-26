import 'package:counter_clean/counter_feature/domain/entities/counter_entity.dart';

abstract class CounterRepository {
  //? get counter value
  Future<CounterEntity> getCounterValue();

  //? save counter value
  Future<void> saveCounterValue(CounterEntity counterEntity);
}
