import 'package:auto_route/auto_route.dart';
import 'package:lumiere_note_sp/presentation/navigation/auth_guard.dart';
import 'package:lumiere_note_sp/presentation/pages/pages.dart';

@CustomAutoRouter(
    replaceInRouteName: 'Page',
    routes: <AutoRoute>[
      AutoRoute(page: InitPage, guards: [AuthGuard]),
      AutoRoute(initial: true, page: LoginPage),
      AutoRoute(page: WelcomePage),
      AutoRoute(page: HomePage),
      AutoRoute(page: EditTripPage),
    ],
    transitionsBuilder: TransitionsBuilders.slideLeft,
    durationInMilliseconds: 400)
class $AppRouter {}
