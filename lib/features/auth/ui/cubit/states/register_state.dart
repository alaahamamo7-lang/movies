class RegisterState {
  final bool isLoading;
  final bool isSuccess;
  final String errorMessage;
  RegisterState({
    this.isSuccess = false,
    this.isLoading = false,
    this.errorMessage = "",
  });
}
