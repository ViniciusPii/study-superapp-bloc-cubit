import 'package:bloc/bloc.dart';

part 'counter_state.dart';

class CounterBloc extends Cubit<CounterState> {
  CounterBloc() : super(CounterInitial());

  void increment() async {
    emit(CounterLoading(counter: state.counter));

    await Future.delayed(const Duration(milliseconds: 800));

    emit(CounterSuccess(counter: state.counter + 1));
  }

  void decrement() async {
    if (state.counter > 0) {
      emit(CounterLoading(counter: state.counter));

      await Future.delayed(const Duration(milliseconds: 800));

      emit(CounterSuccess(counter: state.counter - 1));
    }
  }
}
