import 'package:expense_tracker/core/widgets/text_form_field.dart';
import 'package:expense_tracker/features/login/presentation/cubit/login_cubit.dart';
import 'package:expense_tracker/features/login/presentation/screens/login_screen.dart';
import 'package:expense_tracker/features/register/presentaion/cubit/register_cubit.dart';
import 'package:expense_tracker/features/register/presentaion/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conformPasswordController =
      TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(fontSize: 30.sp, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  spacing: 15.h,
                  children: [
                    CustomTextFormField(
                      controller: nameController,
                      hintText: 'enter your name',
                      labelText: 'Name',
                      keyboardType: .name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter your name";
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      controller: phoneController,
                      hintText: 'enter your phone number',
                      labelText: 'Phone',
                      keyboardType: .number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter your phone";
                        }
                        if (value.length < 11) {
                          return "enter valid phone number";
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      hintText: 'nada@gmail.com',
                      labelText: 'Email',
                      keyboardType: .emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter your Email";
                        }
                        final RegExp emailRegex = RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        );
                        if (!emailRegex.hasMatch(value)) {
                          return "enter valid email";
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: 'enter your password',
                      labelText: 'Password',
                      keyboardType: .visiblePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter your password";
                        }
                        if (value.length < 6) {
                          return "password should be more than 6 char";
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      controller: conformPasswordController,
                      hintText: 'ReEnter your password',
                      labelText: 'Password Confirmation',
                      keyboardType: .visiblePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter your password";
                        }
                        if (!(passwordController.text ==
                            conformPasswordController.text)) {
                          return "paswword doesn't match ";
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      controller: genderController,
                      hintText: 'enter 0 if you are male andd enter 1 if',
                      labelText: 'Gender',
                      keyboardType: .name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter your name";
                        }
                        if (value != '0' && value != '1') {
                          return "value must be 0 or 1";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              BlocConsumer<RegisterCubit, RegisterStates>(
                listener: (context, state) {
                  if (state is RegisterSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Sign Up successful"),
                        duration: Duration(seconds: 3),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => LoginCubit(),
                          child: LoginScreen(),
                        ),
                      ),
                    );
                  }
                  if (state is RegisterFailer) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.error),
                        duration: Duration(seconds: 3),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<RegisterCubit>().signUp(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                    child: state is RegisterLoading
                        ? CircularProgressIndicator()
                        : Text("Sign Up"),
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => LoginCubit(),
                        child: LoginScreen(),
                      ),
                    ),
                  );
                },
                child: Text("login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
