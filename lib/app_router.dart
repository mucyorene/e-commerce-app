import 'package:clothes_app_starter/screens/Home/home_screen.dart';
import 'package:clothes_app_starter/screens/New/create_product.dart';
import 'package:clothes_app_starter/screens/splash.dart';
import 'package:go_router/go_router.dart';

final routers = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => SplashScreen(),
  ),
  GoRoute(path: "/home", builder: (context, state) => HomeScreen()),
  GoRoute(path: "/create", builder: (context, state) => NewItem())
]);
