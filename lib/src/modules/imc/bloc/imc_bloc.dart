import 'dart:async';

part 'imc_event.dart';
part 'imc_state.dart';

class ImcBloc {
  ImcBloc() {
    _imcControllerEvent.stream.listen(_mapEvent);
  }

  final _imcControllerEvent = StreamController<ImcEvent>();
  final _imcControllerState = StreamController<ImcState>.broadcast();

  Sink<ImcEvent> get imcEvent => _imcControllerEvent.sink;
  Stream<ImcState> get imcStateStream => _imcControllerState.stream;

  double _imc = 0;
  String _result = '';

  _mapEvent(ImcEvent event) async {
    _imcControllerState.add(ImcLoading());

    await Future.delayed(const Duration(milliseconds: 800));

    if (event is ImcCalculate) {
      _imcCalculate(event.height, event.weight);
    }

    _imcControllerState.add(ImcSuccess(imc: _imc, result: _result));
  }

  void _imcCalculate(double height, double weight) {
    _imc = weight / (height * height);

    if (_imc < 18.5) {
      _result = 'Abaixo do peso';
    } else if (_imc <= 24.9) {
      _result = 'Peso normal';
    } else if (_imc <= 29.9) {
      _result = 'Sobrepeso';
    } else if (_imc <= 34.9) {
      _result = 'Obesidade 1';
    } else if (_imc <= 39.9) {
      _result = 'Obesidade 2';
    } else {
      _result = 'Obesidade 3';
    }
  }

  void dispose() {
    _imcControllerEvent.close();
    _imcControllerState.close();
  }
}
