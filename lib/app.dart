import 'package:developine_app/app_parent_view.dart';
import 'package:developine_app/core/bloc/network_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/bloc/network_state.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NetworkCubit(NetworkInitialState()),
      child: AppParentView(),
    );
  }
}
