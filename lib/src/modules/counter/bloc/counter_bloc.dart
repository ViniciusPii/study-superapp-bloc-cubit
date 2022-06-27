import 'package:bloc/bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrement>(_increment);
    on<CounterDecrement>(_decrement);
  }

  void _increment(CounterIncrement event, Emitter<CounterState> emit) async {
    emit(CounterLoading(counter: state.counter));

    await Future.delayed(const Duration(milliseconds: 800));

    emit(CounterSuccess(counter: state.counter + 1));
  }

  void _decrement(CounterDecrement event, Emitter<CounterState> emit) async {
    if (state.counter > 0) {
      emit(CounterLoading(counter: state.counter));

      await Future.delayed(const Duration(milliseconds: 800));

      emit(CounterSuccess(counter: state.counter - 1));
    }
  }
}
