class CubitAuthState {
  final bool? isLoading;
  final String? errorMessage;
  final bool isAuthenticated;
  CubitAuthState({
    this.isLoading,
    this.errorMessage,
    required this.isAuthenticated,
  });

  CubitAuthState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isAuthenticated,
  }) {
    return CubitAuthState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}
