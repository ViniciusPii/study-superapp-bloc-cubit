import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superapp/src/core/components/input_component.dart';
import 'package:superapp/src/core/theme/app_dimension.dart';
import 'package:superapp/src/core/theme/app_fonts.dart';
import 'package:superapp/src/core/utils/utils.dart';
import 'package:superapp/src/modules/imc/bloc/imc_bloc.dart';
import 'package:validatorless/validatorless.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({Key? key}) : super(key: key);

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  late final ImcBloc bloc;

  final _formKey = GlobalKey<FormState>();
  final _heightEC = TextEditingController();
  final _weightEC = TextEditingController();

  @override
  void initState() {
    bloc = context.read<ImcBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _heightEC.dispose();
    _weightEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Utils.getColor(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('Imc Bloc Pkg'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimension.size_2,
          horizontal: AppDimension.size_3,
        ),
        child: Column(
          children: [
            _buildTitle(),
            const SizedBox(
              height: AppDimension.size_3,
            ),
            _buildForms(color),
            const SizedBox(
              height: AppDimension.size_2,
            ),
            _buildResult(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Calculadora de Imc!',
      style: AppFonts.titleLarge(),
    );
  }

  Widget _buildResult() {
    return BlocBuilder<ImcBloc, ImcState>(
      builder: (context, state) {
        return Visibility(
          visible: state is ImcSuccess,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Seu imc é ${state.imc.toStringAsFixed(1)}',
                style: AppFonts.bodyLarge(),
              ),
              Text(
                state.result,
                style: AppFonts.titleLarge(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildForms(Color color) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputComponent(
            color: color,
            label: 'Altura',
            controller: _heightEC,
            type: TextInputType.number,
            validators: Validatorless.required('Campo obrigatório'),
          ),
          const SizedBox(
            height: AppDimension.size_2,
          ),
          InputComponent(
            color: color,
            label: 'Peso',
            controller: _weightEC,
            type: TextInputType.number,
            validators: Validatorless.required('Campo obrigatório'),
          ),
          const SizedBox(
            height: AppDimension.size_4,
          ),
          BlocBuilder<ImcBloc, ImcState>(
            builder: (context, state) {
              return Visibility(
                visible: state is ImcLoading,
                replacement: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      bloc.add(
                        ImcCalculate(
                          height: double.parse(_heightEC.text.replaceAll(',', '.')),
                          weight: double.parse(_weightEC.text.replaceAll(',', '.')),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(primary: color),
                  child: const Text('Calcular'),
                ),
                child: CircularProgressIndicator(color: color),
              );
            },
          ),
        ],
      ),
    );
  }
}
