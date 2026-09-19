import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/service/firebase_service.dart';
import 'package:movies/features/auth/ui/cubit/states/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._auth) : super(LoginState(isLoading: false));
  final FirebaseAuth _auth;

  Future<void> login({required String email, required String password}) async {
    try {
      print("Login() Called");
      emit(LoginState(isLoading: true));
      print("waiting for Firebase");
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .timeout(const Duration(seconds: 15));
      print("Account Found");
      emit(LoginState(isSuccess: true));
    } catch (e) {
      print("CAUGHT: ${e.runtimeType} | $e");

      String message = 'Something went wrong. Try again.';
      if (e is FirebaseAuthException) {
        if (e.code == 'invalid-credential' ||
            e.code == 'user-not-found' ||
            e.code == 'wrong-password') {
          message = 'Incorrect email or password.';
        } else if (e.code == 'invalid-email') {
          message = 'Invalid email address.';
        } else if (e.code == 'network-request-failed') {
          message = 'No internet connection.';
        } else {
          message = 'Login failed (${e.code}).';
        }
      }

      if (isClosed) return;
      emit(
        LoginState(isSuccess: false, isLoading: false, errorMessage: message),
      );
    }
  }

  Future<void> logout() async {
    try {
      emit(LoginState(isLoading: true));
      await FirebaseAuth.instance.signOut();
      // emit(LoginState(isLoading: false));
    } on Exception catch (e) {
      throw e.toString();
    }
  }

  Future<void> LoginWithGoogle() async {
    try {
      emit(LoginState(isLoading: true));
      await FirebaseService().signInWithGoogle();
      emit(LoginState(isLoading: false, isSuccess: true));
    } on Exception catch (e) {
      emit(
        LoginState(
          isLoading: false,
          isSuccess: false,
          errorMessage: e.toString(),
        ),
      );
      // throw e.toString();
    }
  }
}
