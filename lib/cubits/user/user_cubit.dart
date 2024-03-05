import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user.dart';
import '../../service_locator.dart';
import '../../services/api/auth_service.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  AuthService get _authService => ServiceLocator().authService;

  UserCubit() : super(UserStateInitial()) {
    _init();
  }

  _init() {
    getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    emit(UserStateLoading());
    _authService.getCurrentUser().then((response) async {
      emit(UserStateLoaded(user: User(response['name'], response['email'])));
    }).catchError((onError) {
      emit(UserStateError(message: 'error'));
    });
  }
}
