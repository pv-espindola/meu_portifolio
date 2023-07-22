enum AppStatus {loading, completed}

class AppState{
  AppStatus status;
  double screenWidth;

  AppState({
    required this.status,
    required this.screenWidth,
});
  factory AppState.empty() => AppState(status: AppStatus.loading, screenWidth: 0);

  AppState copyWith({
    AppStatus? status,
    double? screenWidth,
  }) {
    return AppState(
      status: status ?? this.status,
      screenWidth: screenWidth ?? this.screenWidth,
    );
  }
}