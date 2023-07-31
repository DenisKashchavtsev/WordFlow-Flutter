import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/category/category_cubit.dart';
import 'cubits/user/user_cubit.dart';
import 'pages/categories/create_category.dart';
import 'pages/dashboard.dart';
import 'pages/home.dart';
import 'pages/auth/login.dart';
import 'pages/auth/register.dart';

class Routes {
  final BuildContext context;

  Routes(this.context);

  Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      '/': (context) => const Home(),
      '/login': (context) => BlocProvider(
            create: (BuildContext context) => UserCubit(),
            child: Login(),
          ),
      '/register': (context) => BlocProvider(
            create: (BuildContext context) => UserCubit(),
            child: Register(),
          ),
      '/dashboard': (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) {
                  return UserCubit()..getCurrentUser();
                },
              ),
              BlocProvider(
                create: (context) {
                  return CategoryCubit()..getList();
                },
              ),
            ],
            child: Dashboard(),
          ),
      '/create-category': (context) => BlocProvider(
            create: (BuildContext context) => CategoryCubit(),
            child: CreateCategory(),
          ),
    };
  }
}
