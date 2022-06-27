import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
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
    bloc = GetIt.I();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Utils.getColor(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('Contador Bloc'),
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
    return StreamBuilder<CounterState>(
      stream: bloc.counterStateStream,
      initialData: CounterInitial(),
      builder: (context, snapshot) {
        return Text(
          'Contador ${snapshot.data!.counter}',
          style: AppFonts.titleLarge(),
        );
      },
    );
  }

  Widget _buildButtons(Color color) {
    return StreamBuilder<CounterState>(
      stream: bloc.counterStateStream,
      builder: (context, snapshot) {
        return Visibility(
          visible: snapshot.data is CounterLoading,
          replacement: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => bloc.counterEvent.add(CounterIncrement()),
                child: Text(
                  '+',
                  style: AppFonts.titleLarge(),
                ),
              ),
              TextButton(
                onPressed: () => bloc.counterEvent.add(CounterDecrement()),
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
