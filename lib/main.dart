import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/pages/about.dart';
import 'package:weather_app/pages/weather_start.dart';

void main() {
  //create the routes and initial location
  final goRouter = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: WeatherPage());
        },
      ),
      GoRoute(
        path: '/about',
        pageBuilder: (context, state) {
          return const MaterialPage(child: AboutPage());
        },
      ),
    ],
  );

  runApp(MainApp(goRouter: goRouter));
}

//run app with router
class MainApp extends StatelessWidget {
  final GoRouter goRouter;
  const MainApp({Key? key, required this.goRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
    );
  }
}
