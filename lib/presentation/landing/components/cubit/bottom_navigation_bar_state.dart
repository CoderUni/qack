part of 'bottom_navigation_bar_cubit.dart';

enum SelectedPage {
  home,
  history,
  dictionary,
  settings,
}

final class BottomNavigationBarState extends Equatable {
  const BottomNavigationBarState(
    this.selectedPage,
  );
  final SelectedPage selectedPage;

  @override
  List<Object> get props => [selectedPage];

  BottomNavigationBarState copyWith({
    SelectedPage? selectedPage,
  }) {
    return BottomNavigationBarState(
      selectedPage ?? this.selectedPage,
    );
  }
}
