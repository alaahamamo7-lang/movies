import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/constants/app_text.dart';
import 'package:movies/core/constants/routes/app_routes.dart';
import 'package:movies/core/service/firebase_service.dart';
import 'package:movies/features/auth/ui/cubit/states/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._auth) : super(LoginState(isLoading: false));
  final FirebaseAuth _auth;

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // print("Login() Called");
      emit(LoginState(isLoading: true));
      // print("waiting for Firebase");
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .timeout(const Duration(seconds: 15));
      // print("Account Found");
      emit(LoginState(isSuccess: true));
      if (context.mounted) {
        Navigator.pushReplacement(context, AppRoutes.homeScreen());
      }
    } catch (e) {
      // print("CAUGHT: ${e.runtimeType} | $e");

      String message = AppText.somethingWentWrong;
      if (e is FirebaseAuthException) {
        if (e.code == 'invalid-credential' ||
            e.code == AppText.userNotFound ||
            e.code == AppText.wrongPassword) {
          message = AppText.invalidCredentials;
        } else if (e.code == 'invalid-email') {
          message = AppText.invalidEmail;
        } else if (e.code == AppText.networkRequestFailed) {
          message = AppText.noInternetConnection;
        } else {
          message = AppText.loginFailed;
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

  Future<void> LoginWithGoogle(BuildContext context) async {
    try {
      emit(LoginState(isLoading: true));
      await FirebaseService().signInWithGoogle();
      emit(LoginState(isLoading: false, isSuccess: true));
      if (context.mounted) {
        Navigator.pushReplacement(context, AppRoutes.homeScreen());
      }
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
