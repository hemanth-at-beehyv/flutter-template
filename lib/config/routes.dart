import 'package:go_router/go_router.dart';
import 'package:template/features/home/presentation/screens/home_screen.dart';

class AppRouter {
  static final dummyRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
}
