import 'package:bloc/bloc.dart';

part 'imc_event.dart';
part 'imc_state.dart';

class ImcBloc extends Bloc<ImcEvent, ImcState> {
  ImcBloc() : super(ImcInitial()) {
    on<ImcCalculate>(_imcCalculate);
  }

  void _imcCalculate(ImcCalculate event, Emitter<ImcState> emit) async {
    emit(ImcLoading());

    await Future.delayed(const Duration(milliseconds: 800));

    String imcResult = '';
    double imc = event.weight / (event.height * event.height);

    if (imc < 18.5) {
      imcResult = 'Abaixo do peso';
    } else if (imc <= 24.9) {
      imcResult = 'Peso normal';
    } else if (imc <= 29.9) {
      imcResult = 'Sobrepeso';
    } else if (imc <= 34.9) {
      imcResult = 'Obesidade 1';
    } else if (imc <= 39.9) {
      imcResult = 'Obesidade 2';
    } else {
      imcResult = 'Obesidade 3';
    }

    emit(ImcSuccess(imc: imc, result: imcResult));
  }
}
