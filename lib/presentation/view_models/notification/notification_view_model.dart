import 'dart:async';

import 'package:lumiere_note_sp/presentation/navigation/navigation_handler.dart';
import 'package:lumiere_note_sp/presentation/pages/notification/mock/notification_model.dart';
import 'package:lumiere_note_sp/presentation/view_models/base/base_view_model.dart';
import 'package:lumiere_note_sp/presentation/view_models/notification/notification_state.dart';

class NotificationViewModel extends BaseViewModel<NotificationState> {
  NotificationViewModel({required this.navigationHandler})
      : super(NotificationState());

  final NavigationHandler navigationHandler;

  @override
  Future<void> onInit() async {
    setNotifications();
  }

  void setTabIndex(int tabIndex) {
    setState(
      (state) => state.copyWith(
        tabIndex: TabIndex.values.firstWhere(
          (element) => element.index == tabIndex,
        ),
      ),
    );
  }

  void setTabBarSelectedValue(int value) {
    setState((state) => state.copyWith(
          tabBarSelected: value,
        ));
  }

  void setNotifications() {
    final notices = MockNotificationData.notices;
    setState((state) => state.copyWith(listNotice: notices));
  }
}
