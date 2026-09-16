import 'package:expense_tracker/core/data%20source/firebase_datasource.dart';
import 'package:expense_tracker/features/register/presentaion/cubit/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitial());
  final FirebaseDatasource datasource = FirebaseDatasource();
  Future<void> signUp({required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      final user = await datasource.signUp(email: email, password: password);
      if (user != null) {
        emit(RegisterSuccess());
      } else {
        emit(RegisterFailer(error: "sigup failed"));
      }
    } on Exception catch (e) {
      emit(RegisterFailer(error: e.toString()));
    }
  }
}
