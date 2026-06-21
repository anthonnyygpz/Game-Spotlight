class NavigationState {
  final int row;
  final int col;
  final int navIndex;
  final int heroSlideIndex;
  final int activeRouteIndex;

  NavigationState({
    this.row = 0,
    this.col = 0,
    this.navIndex = 0,
    this.heroSlideIndex = 0,
    this.activeRouteIndex = 0,
  });

  NavigationState copyWith({
    int? row,
    int? col,
    int? navIndex,
    int? heroSlideIndex,
    int? activeRouteIndex,
  }) {
    return NavigationState(
      row: row ?? this.row,
      col: col ?? this.col,
      navIndex: navIndex ?? this.navIndex,
      heroSlideIndex: heroSlideIndex ?? this.heroSlideIndex,
      activeRouteIndex: activeRouteIndex ?? this.activeRouteIndex,
    );
  }
}
