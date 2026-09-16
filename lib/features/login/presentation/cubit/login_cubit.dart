import 'package:expense_tracker/core/data%20source/firebase_datasource.dart';
import 'package:expense_tracker/features/login/presentation/cubit/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInit());
  FirebaseDatasource datasource = FirebaseDatasource();
  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      final user = await datasource.login(email: email, password: password);
      if (user != null) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailer(error: "login failed"));
      }
    } on Exception catch (e) {
      emit(LoginFailer(error: e.toString()));
    }
  }
}
