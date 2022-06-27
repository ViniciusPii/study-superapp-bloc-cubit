import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superapp/src/core/theme/app_dimension.dart';
import 'package:superapp/src/core/theme/app_fonts.dart';
import 'package:superapp/src/core/utils/utils.dart';
import 'package:superapp/src/modules/counter/bloc/counter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late final CounterBloc bloc;

  @override
  void initState() {
    bloc = context.read<CounterBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = Utils.getColor(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('Contador'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCounter(),
            const SizedBox(
              height: AppDimension.size_2,
            ),
            _buildButtons(color),
          ],
        ),
      ),
    );
  }

  Widget _buildCounter() {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Text(
          'Contador ${state.counter}',
          style: AppFonts.titleLarge(),
        );
      },
    );
  }

  Widget _buildButtons(Color color) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Visibility(
          visible: state is CounterLoading,
          replacement: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => bloc.add(CounterIncrement()),
                child: Text(
                  '+',
                  style: AppFonts.titleLarge(),
                ),
              ),
              TextButton(
                onPressed: () => bloc.add(CounterDecrement()),
                child: Text(
                  '-',
                  style: AppFonts.titleLarge(),
                ),
              ),
            ],
          ),
          child: CircularProgressIndicator(
            color: color,
          ),
        );
      },
    );
  }
}
