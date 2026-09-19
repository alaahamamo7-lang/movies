class LoginState {
  final bool isLoading;
  final bool isSuccess;
  final String errorMessage;
  LoginState({
    this.isSuccess = false,
    this.isLoading = false,
    this.errorMessage = "",
  });
}
