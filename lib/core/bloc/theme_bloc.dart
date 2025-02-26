import 'package:bloc/bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(isDark: false)) {
    on<ThemeEvent>(_changeTheme);
  }

  //? change theme bloc
  void _changeTheme(event, emit) {
    emit(ThemeState(isDark: !state.isDark));
  }
}
