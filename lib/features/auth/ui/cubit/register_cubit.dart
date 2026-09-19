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
      // debugPrint('email="${email}" len=${email.length}');
      // debugPrint('controller hash=${email.hashCode}');
      // debugPrint(
      //   'SENDING email="$email" len=${email.length} pw_len=${password.length}',
      // );
      // final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseService().createAccount(email: email, password: password);
      // debugPrint('probe OK: ${probe.user?.uid}');
      // if (context.mounted) {
      //   Navigator.pushReplacement(context, AppRoutes.loginScreen());
      // }
      emit(RegisterState(isLoading: false, isSuccess: true));
    } catch (e) {
      // debugPrint('EMPTY-EMAIL RESULT: ${e.runtimeType} | $e');
      // print("error:${e.toString()}");
      emit(
        RegisterState(
          isLoading: false,
          errorMessage: e.toString(),
          isSuccess: false,
        ),
      );
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(e.toString(), textAlign: TextAlign.center),
      //     backgroundColor: AppColor.red,
      //     behavior: SnackBarBehavior.floating,
      //     width: 300,
      //   ),
      // );
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      emit(RegisterState(isLoading: true));
      final result = await FirebaseService().signInWithGoogle();
      // print("Account Created Successfully");
      // emit(RegisterState(isLoading: false));
    } catch (e) {
      print(e.toString());
      emit(RegisterState(isLoading: false, errorMessage: e.toString()));
    }
  }
}
