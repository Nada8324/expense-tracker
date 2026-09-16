import 'package:expense_tracker/core/data%20source/firebase_datasource.dart';
import 'package:expense_tracker/features/forgetpassword/presentation/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordCubit extends Cubit<PasswordStates> {
  PasswordCubit() : super(PasswordInit());
  final FirebaseDatasource datasource = FirebaseDatasource();
  Future<void> reserPassword(String email) async {
    emit(PasswordLoading());
    try {
      await datasource.forgetpassword(email);
      emit(PasswordSuccess());
    } on Exception catch (e) {
      emit(PasswordFailer(error: e.toString()));
    }
  }
}
