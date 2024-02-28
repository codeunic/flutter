import 'package:flutter_application_not/presentation/screens/detail_screen.dart';
import 'package:flutter_application_not/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: "/push-details/:messageId",
    builder: (context, state) => DetailScreen(
      pushMessageId: state.pathParameters["messageId"] ?? '',
    ),
  ),
]);
