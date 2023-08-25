import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        builder: (context, child) {
          double statusBarHeight = MediaQuery.of(context).padding.top;
          double navigationBarHeight = MediaQuery.of(context).padding.bottom;

          return Padding(
            padding: EdgeInsets.only(
              top: statusBarHeight,
              bottom: navigationBarHeight,
            ),
            child: child,
          );
        },
        navigatorKey: NavigationService.navigationKey,
        routes: Routes(context).getRoutes(),
        theme: ThemeData(scaffoldBackgroundColor: Styles.colorBody),
      ),
    );
  }
}
