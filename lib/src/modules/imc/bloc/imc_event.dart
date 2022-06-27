part of 'imc_bloc.dart';

abstract class ImcEvent {}

class ImcCalculate extends ImcEvent {
  ImcCalculate({
    required this.height,
    required this.weight,
  });

  final double height;
  final double weight;
}
