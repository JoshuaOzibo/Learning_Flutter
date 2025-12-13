class ViewmodelState {
  final String? emailController;
  final String? email;
  final bool isLoading;
  final String? errorMessage;
  final bool isAuthenticated;
  final String? validationCode;
  final String? changedValidationCode;
  final bool activateButton;

  ViewmodelState({
    this.emailController,
    this.email,
    this.isLoading = false,
    this.errorMessage,
    required this.isAuthenticated,
    this.validationCode,
    this.changedValidationCode,
    this.activateButton = false,
  });

  ViewmodelState copyWith({
    String? emailController,
    String? email,
    bool? isLoading,
    String? errorMessage,
    bool? isAuthenticated,
    String? validationCode,
    String? changedValidationCode,
    bool? activateButton,
  }) {
    return ViewmodelState(
      emailController: emailController ?? this.emailController,
      email: email ?? this.email,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      validationCode: validationCode ?? this.validationCode,
      changedValidationCode:
          changedValidationCode ?? this.changedValidationCode,
      activateButton: activateButton ?? this.activateButton,
    );
  }
}
