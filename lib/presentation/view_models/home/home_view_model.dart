import 'package:lumiere_note_sp/presentation/view_models/base/base_view_model.dart';
import 'package:lumiere_note_sp/presentation/view_models/home/home_state.dart';

class HomeViewModel extends BaseViewModel<HomeState> {
  HomeViewModel() : super(HomeState());

  @override
  void onInit() {}

  void setTabIndex(int tabIndex) {
    setState(
      (state) => state.copyWith(tabBarSelected: tabIndex),
    );
  }
}
