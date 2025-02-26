import 'package:counter_clean/counter_feature/data/repositories/counter_repository_impl.dart';
import 'package:counter_clean/counter_feature/domain/repositories/counter_repository.dart';
import 'package:counter_clean/counter_feature/domain/usecase/decreasement_counter_usecase.dart';
import 'package:counter_clean/counter_feature/domain/usecase/increasement_counter_usecase.dart';
import 'package:counter_clean/counter_feature/domain/usecase/reset_counter_usecase.dart';
import 'package:counter_clean/counter_feature/presentation/bloc/counter_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setup() {
  //* repositories
  locator.registerSingleton<CounterRepository>(CounterRepositoryImpl());

  //* usecases
  locator.registerSingleton<IncreasementCounterUsecase>(
    IncreasementCounterUsecase(locator()),
  );

  locator.registerSingleton<DecreasementCounterUsecase>(
    DecreasementCounterUsecase(locator()),
  );

  locator.registerSingleton<ResetCounterUsecase>(
    ResetCounterUsecase(locator()),
  );

  //* bloc
  locator.registerSingleton<CounterBloc>(
    CounterBloc(locator(), locator(), locator()),
  );
}
