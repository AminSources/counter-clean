import 'package:counter_clean/core/bloc/theme_bloc.dart';
import 'package:counter_clean/counter_feature/presentation/bloc/counter_bloc.dart';
import 'package:counter_clean/counter_feature/presentation/pages/counter_page.dart';
import 'package:counter_clean/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  //? init locator
  setup();

  //? run app
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeBloc()),
        BlocProvider(create: (_) => locator<CounterBloc>()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter Clean App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode:
          context.watch<ThemeBloc>().state.isDark
              ? ThemeMode.dark
              : ThemeMode.light,
      home: BlocProvider(
        create: (context) => locator<CounterBloc>(),
        child: CounterPage(),
      ),
    );
  }
}
