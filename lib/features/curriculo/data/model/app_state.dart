enum AppStatus {loading, completed}
enum LayoutStyle {curriculoExpanded, metaExpanded}
class AppState{
  AppStatus status;
  double screenWidth;
  LayoutStyle layoutStyle;

  AppState({
    required this.status,
    required this.screenWidth,
    required this.layoutStyle,
});
  factory AppState.empty() => AppState(
      status: AppStatus.loading,
      layoutStyle: LayoutStyle.curriculoExpanded,
      screenWidth: 0);

  AppState copyWith({
    AppStatus? status,
    double? screenWidth,
    LayoutStyle? layoutStyle,
  }) {
    return AppState(
      status: status ?? this.status,
      screenWidth: screenWidth ?? this.screenWidth,
      layoutStyle: layoutStyle ?? this.layoutStyle,
    );
  }
}