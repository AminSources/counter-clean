import 'package:counter_clean/core/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeButtonWidget extends StatelessWidget {
  const ThemeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        //? toggle theme
        context.read<ThemeBloc>().add(ChangeThemeEvent());
      },
      icon: Icon(Icons.dark_mode_rounded),
    );
  }
}
