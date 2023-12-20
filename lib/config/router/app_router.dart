import 'package:go_router/go_router.dart';

import '../../presentation/views/view.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeView(),
  ),
  GoRoute(
    path: '/description/:id',
    builder: (context, state) {
      final id = state.pathParameters['id']!;
      return DescriptionView(id: id);
    }
  ),
]);
