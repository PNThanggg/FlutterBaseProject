import 'package:get/get.dart';

import '../screen/home/home_binding.dart';
import '../screen/home/home_screen.dart';
import '../screen/splash/splash_binding.dart';
import '../screen/splash/splash_screen.dart';
import 'app_route.dart';

class AppPage {
  static final pages = [
    GetPage(name: AppRoute.homeScreen, page: () => const HomeScreen(), binding: HomeBinding()),
    GetPage(name: AppRoute.splashScreen, page: () => const SplashScreen(), binding: SplashBinding()),
  ];
}