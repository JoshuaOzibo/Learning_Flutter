class ViewmodelState {
  String emailController;
  bool isLoading;
  String errorMessage;
  bool isAuthenticated = false;

  ViewmodelState(this.emailController, this.isLoading, this.errorMessage, {required this.isAuthenticated});
}
