import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/service/firebase_service.dart';

class RegisterStates {
  final bool isLoading;
  final String errorMessage;
  RegisterStates({this.isLoading = false, this.errorMessage = ""});
}

class RegisterViewModel extends Cubit<RegisterStates> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  RegisterViewModel() : super(RegisterStates(isLoading: false));

  Future<void> register() async {
    try {
      emit(RegisterStates(isLoading: true));
      await FirebaseService().createAccount(
        email: emailController.text,
        password: passwordController.text,
      );
      emit(RegisterStates(isLoading: false));
    } catch (e) {
      emit(RegisterStates(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      emit(RegisterStates(isLoading: true));
      final result = await FirebaseService().signInWithGoogle();
      emit(RegisterStates(isLoading: false));
    } catch (e) {
      emit(RegisterStates(isLoading: false, errorMessage: e.toString()));
    }
  }
}
