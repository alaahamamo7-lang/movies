import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/auth/ui/cubit/states/forget_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgotPasswordCubit(this._auth) : super(ForgetPasswordState());
  final FirebaseAuth _auth;

  Future<void> sendReset(String email) async {
    if (email.trim().isEmpty) {
      emit(ForgetPasswordState(errorMessage: 'Enter your email.'));
      return;
    }
    emit(ForgetPasswordState(isLoading: true));
    try {
      await _auth
          .sendPasswordResetEmail(email: email.trim())
          .timeout(const Duration(seconds: 15));
      if (isClosed) return;
      emit(ForgetPasswordState(isSuccess: true));
    } catch (e) {
      debugPrint('RESET ERROR: $e');
      String message = 'Something went wrong. Try again.';
      if (e is FirebaseAuthException) {
        if (e.code == 'invalid-email') {
          message = 'Invalid email address.';
        } else if (e.code == 'user-not-found') {
          message = 'No account found for this email.';
        } else if (e.code == 'too-many-requests') {
          message = 'Too many attempts. Try again later.';
        } else if (e.code == 'network-request-failed') {
          message = 'No internet connection.';
        } else {
          message = 'Reset failed (${e.code}).';
        }
      }
      if (isClosed) return;
      emit(ForgetPasswordState(errorMessage: message));
    }
  }
}
