import 'package:digitaldungeons/blocs/welcome/welcome_bloc.dart';
import 'package:digitaldungeons/blocs/welcome/welcome_events.dart';
import 'package:digitaldungeons/blocs/welcome/welcome_state.dart';
import 'package:digitaldungeons/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  final String title;

  WelcomeScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WelcomeBloc>(
      create: (providerContext) => WelcomeBloc(),
      child:Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Builder(
          builder: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('You have pushed the button this many times:'),
                BlocBuilder<WelcomeBloc, WelcomeState>(
                  builder: (blocContext, state) => Text('${state.value}', style: Theme.of(context).textTheme.headline4,),
                ),
                FloatingActionButton(
                  onPressed: () {
                    print('Click!');
                    context.read<WelcomeBloc>().add(WelcomeIncrementEvent());
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
        ), 
      ),
    );
  }
}
