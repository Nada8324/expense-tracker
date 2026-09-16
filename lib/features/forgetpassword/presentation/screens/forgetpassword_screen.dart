import 'package:expense_tracker/core/widgets/text_form_field.dart';
import 'package:expense_tracker/features/forgetpassword/presentation/cubit/cubit.dart';
import 'package:expense_tracker/features/forgetpassword/presentation/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetpasswordScreen extends StatelessWidget {
  ForgetpasswordScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 20.h,
        children: [
          Text("enter your email"),
          CustomTextFormField(
            controller: emailController,
            hintText: "nada@gmail.com",
            labelText: 'email',
          ),
          BlocConsumer<PasswordCubit, PasswordStates>(
            listener: (context, state) {
              if (state is PasswordSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("reset password email sent ")),
                );
                Navigator.pop(context);
              }
            },
            builder: (context, state) => ElevatedButton( 
              onPressed: () {
                context.read<PasswordCubit>().reserPassword(
                  emailController.text,
                );
              },
              child: state is PasswordLoading
                  ? CircularProgressIndicator()
                  : Text("Reset password"),
            ),
          ),
        ],
      ),
    );
  }
}
