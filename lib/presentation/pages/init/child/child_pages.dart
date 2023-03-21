import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lumiere_note_sp/generated/locale_keys.g.dart';
import 'package:lumiere_note_sp/presentation/pages/pages.dart';
import 'package:lumiere_note_sp/presentation/theme/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Text(LocaleKeys.pleaseAddContent.tr()),
          ),
        ),
      );
}

List<Widget> buildInitScreen() => [
      HomePage(),
      NewTripScreen(),
      MyAccountPage(),
    ];

List<PersistentBottomNavBarItem> navBarsInitScreen() => [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/icons/svg/ic_home.svg",
          color: AppColors.primary,
        ),
        title: LocaleKeys.homeTitle.tr(),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/icons/svg/ic_handshake.svg",
          color: AppColors.primary,
        ),
        title: LocaleKeys.handshakeText.tr(),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/icons/svg/ic_account.svg",
          color: AppColors.primary,
        ),
        title: LocaleKeys.myPageText.tr(),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.white,
      ),
    ];
