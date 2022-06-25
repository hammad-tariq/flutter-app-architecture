import 'package:developine_app/app_parent_view.dart';
import 'package:developine_app/core/bloc/network_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/injection_container.dart';
import 'features/login/presentation/cubit/login_cubit.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => serviceLocator<LoginCubit>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<NetworkCubit>(),
        ),
      ],
      child: AppParentView(),
    );
  }
}
