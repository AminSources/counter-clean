import 'package:counter_clean/core/widgets/theme_button_widget.dart';
import 'package:counter_clean/counter_feature/presentation/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //* app bar of page
        appBar: AppBar(
          title: const Text("Counter Clean App"),
          actions: [ThemeButtonWidget()],
        ),

        //* body of page
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //* counter
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Text(
                    "Counter: ${state.counterValue}",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  );
                },
              ),

              //* buttons
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //* decrement button
                    FloatingActionButton(
                      onPressed: () {
                        //? decrease counter value
                        context.read<CounterBloc>().add(
                          DecreasementCounterEvent(),
                        );
                      },
                      child: const Icon(Icons.remove_rounded),
                    ),

                    //* increment button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          //? increase counter value
                          context.read<CounterBloc>().add(
                            IncreasementCounterEvent(),
                          );
                        },
                        child: const Icon(Icons.add_rounded),
                      ),
                    ),

                    //* reset button
                    FloatingActionButton(
                      onPressed: () {
                        //? reset counter value
                        context.read<CounterBloc>().add(ResetCounterEvent());
                      },
                      child: const Icon(Icons.restart_alt_rounded),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
