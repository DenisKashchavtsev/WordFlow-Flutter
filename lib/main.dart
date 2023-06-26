import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_flow/pages/widgets/navigation_bar.dart';

import 'configs/styles.dart';
import 'cubits/user/user_cubit.dart';
import 'routes.dart';
import 'services/navigation_service.dart';

Future<void> main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserCubit()),
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.navigationKey,
        routes: Routes(context).getRoutes(),
        theme: ThemeData(scaffoldBackgroundColor: Styles.bodyColor),
      ),
    );
  }
}
