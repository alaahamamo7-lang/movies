class ForgetPasswordState {
  final bool isLoading;
  final bool isSuccess;
  final String errorMessage;
  ForgetPasswordState({
    this.isSuccess = false,
    this.isLoading = false,
    this.errorMessage = "",
  });
}
