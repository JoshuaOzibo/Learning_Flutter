class ViewmodelState {
  final String? emailController;
  final bool? isLoading;
  final String? errorMessage;
  final bool isAuthenticated;

  ViewmodelState({
    this.emailController,
    this.isLoading,
    this.errorMessage,
    required this.isAuthenticated,
  });

  ViewmodelState copyWith({
    String? emailController,
    bool? isLoading,
    String? errorMessage,
    bool? isAuthenticated,
  }) {
    return ViewmodelState(
      emailController: emailController ?? this.emailController,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}
