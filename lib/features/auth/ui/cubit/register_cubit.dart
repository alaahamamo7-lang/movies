import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/constants/app_color.dart';
import 'package:movies/core/constants/routes/app_routes.dart';
import 'package:movies/core/service/firebase_service.dart';
import 'package:movies/features/auth/ui/cubit/states/register_state.dart';

// class RegisterStates {
//   final bool isLoading;
//   final String errorMessage;
//   RegisterStates({this.isLoading = false, this.errorMessage = ""});
// }

class RegisterCubit extends Cubit<RegisterState> {
  // final TextEditingController userNameController = TextEditingController();
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  // final TextEditingController confirmPasswordController =
  //     TextEditingController();
  // final TextEditingController phoneNumberController = TextEditingController();
  RegisterCubit(this._auth) : super(RegisterState(isLoading: false));
  final FirebaseAuth _auth;

  // register({required this.})

  Future<void> register(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    try {
      emit(RegisterState(isLoading: true, isSuccess: false));
      await FirebaseService().createAccount(email: email, password: password);
      if (context.mounted) {
        Navigator.pushReplacement(context, AppRoutes.loginScreen());
      }
      emit(RegisterState(isLoading: false, isSuccess: true));
    } catch (e) {
      emit(
        RegisterState(
          isLoading: false,
          errorMessage: e.toString(),
          isSuccess: false,
        ),
      );
    }
  }
}
