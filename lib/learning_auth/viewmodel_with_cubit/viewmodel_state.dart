class ViewmodelState {
  final String? emailController;
  final bool? isLoading;
  final String? errorMessage;
  final bool isAuthenticated;
  final String? validationCode;
  final String? changedValidationCode;

  ViewmodelState({
    this.emailController,
    this.isLoading,
    this.errorMessage,
    required this.isAuthenticated,
    this.validationCode,
    this.changedValidationCode,
  });

  ViewmodelState copyWith({
    String? emailController,
    bool? isLoading,
    String? errorMessage,
    bool? isAuthenticated,
    String? validationCode,
    String? changedValidationCode,
  }) {
    return ViewmodelState(
      emailController: emailController ?? this.emailController,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      validationCode: validationCode ?? this.validationCode,
      changedValidationCode:
          changedValidationCode ?? this.changedValidationCode,
    );
  }
}
