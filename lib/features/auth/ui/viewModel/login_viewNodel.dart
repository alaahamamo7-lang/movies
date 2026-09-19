import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/service/firebase_service.dart';

class LoginStates {
  final bool isLoading;
  final String errorMessage;
  LoginStates({this.isLoading = false, this.errorMessage = ""});
}

class LoginViewnodel extends Cubit<LoginStates> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginViewnodel() : super(LoginStates(isLoading: false));

  Future<void> login() async {
    emit(LoginStates(isLoading: true));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw ('Wrong password provided for that user.');
      }
    }
  }

  Future<void> logout() async {
    try {
      emit(LoginStates(isLoading: true));
      await FirebaseAuth.instance.signOut();
      emit(LoginStates(isLoading: false));
    } on Exception catch (e) {
      throw e.toString();
    }
  }

  Future<void> LoginWithGoogle() async {
    try {
      emit(LoginStates(isLoading: true));
      await FirebaseService().signInWithGoogle();
      emit(LoginStates(isLoading: false));
    } on Exception catch (e) {
      throw e.toString();
    }
  }
}
