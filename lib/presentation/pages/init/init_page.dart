import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lumiere_note_sp/presentation/pages/init/child/child_pages.dart';
import 'package:lumiere_note_sp/presentation/view_models/init/init_provider.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class InitPage extends StatefulHookConsumerWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _InitPageState();
}

class _InitPageState extends ConsumerState<InitPage> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
  }

  @override
  Widget build(final BuildContext context) {
    final state = ref.watch(initProvider);

    useEffect(() {
      _controller.jumpToTab(state.tabIndex.index);
      return;
    }, [state.tabIndex]);

    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: buildInitScreen(),
        items: navBarsInitScreen(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style1,
      ),
    );
  }
}
