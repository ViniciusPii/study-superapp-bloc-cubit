import 'dart:async';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc {
  CounterBloc() {
    _counterControllerEvent.stream.listen(_mapEvent);
  }

  final _counterControllerEvent = StreamController<CounterEvent>();
  final _counterControllerState = StreamController<CounterState>.broadcast();

  Sink<CounterEvent> get counterEvent => _counterControllerEvent.sink;
  Stream<CounterState> get counterStateStream => _counterControllerState.stream;

  int _counter = 0;

  _mapEvent(CounterEvent event) async {
    _counterControllerState.add(CounterLoading(counter: _counter));

    await Future.delayed(const Duration(milliseconds: 800));

    if (event is CounterIncrement) {
      _increment();
    } else if (event is CounterDecrement) {
      _decrement();
    }

    _counterControllerState.add(CounterSuccess(counter: _counter));
  }

  _increment() {
    _counter++;
  }

  _decrement() {
    if (_counter > 0) {
      _counter--;
    }
  }

  void dispose() {
    _counterControllerEvent.close();
    _counterControllerState.close();
  }
}
