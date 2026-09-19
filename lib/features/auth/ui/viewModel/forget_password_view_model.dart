import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordStates {
  final bool isLoading;
  final String errorMessage;

  ForgetPasswordStates({this.errorMessage = "", this.isLoading = false});
}

class ForgetPasswordViewModel extends Cubit<ForgetPasswordStates> {
  final TextEditingController emailController = TextEditingController();
  ForgetPasswordViewModel() : super(ForgetPasswordStates(isLoading: false));

  Future<void> sendPasswordReset(String email) async {
    try {
      emit(ForgetPasswordStates(isLoading: true));
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(ForgetPasswordStates(isLoading: false));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ForgetPasswordStates(errorMessage: e.toString());
        // handle: no account with that email
      } else if (e.code == 'invalid-email') {
        // handle: malformed email
        throw ForgetPasswordStates(errorMessage: e.toString());
      }
      rethrow;
    }
  }
}
