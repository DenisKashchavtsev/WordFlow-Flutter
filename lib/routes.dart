import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_flow/pages/category/create_category.dart';
import 'package:word_flow/pages/category/show_category.dart';
import 'package:word_flow/pages/greeting.dart';
import 'package:word_flow/pages/word/create_word.dart';

import 'cubits/auth/register/register_cubit.dart';
import 'cubits/auth/token/token_cubit.dart';
import 'cubits/category/category_cubit.dart';
import 'cubits/user/user_cubit.dart';
import 'cubits/word/word_cubit.dart';
import 'pages/category/update_category.dart';
import 'pages/dashboard.dart';
import 'pages/auth/login/login.dart';
import 'pages/auth/register/register.dart';
import 'pages/learning/steps/steps.dart';
import 'pages/word/update_word.dart';

class Routes {
  final BuildContext context;

  Routes(this.context);

  Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      '/': (context) => const Greeting(),
      '/login': (context) => BlocProvider(
            create: (BuildContext context) => TokenCubit(),
            child: const Login(),
          ),
      '/registration': (context) => BlocProvider(
            create: (BuildContext context) => RegisterCubit(),
            child: const Register(),
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
            child: const Dashboard(),
          ),
      '/create-category': (context) => BlocProvider(
            create: (BuildContext context) => CategoryCubit(),
            child: CreateCategory(),
          ),

      '/update-category': (context) => BlocProvider(
        create: (BuildContext context) => CategoryCubit(),
        child: const UpdateCategory(),
      ),

      '/show-category': (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              return CategoryCubit();
            },
          ),
          BlocProvider(
            create: (context) {
              return WordCubit();
            },
          ),
        ],
        child: const ShowCategory(),
      ),

      '/create-word': (context) => BlocProvider(
            create: (BuildContext context) => WordCubit(),
            child: const CreateWord(),
          ),

      '/update-word': (context) => BlocProvider(
            create: (BuildContext context) => WordCubit(),
            child: const UpdateWord(),
          ),

      '/steps': (context) => BlocProvider(
        create: (BuildContext context) => CategoryCubit(),
        child: const Steps(),
      ),

    };
  }
}
