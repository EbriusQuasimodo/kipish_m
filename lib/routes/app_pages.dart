import 'package:get/get.dart';
import 'package:kipish_m/features/enter/login/bindings/login_signin_binding.dart';
import 'package:kipish_m/features/enter/login/views/login_signin_view.dart';
import 'package:kipish_m/features/enter/reset_password/bindings/reset_password_binding.dart';
import 'package:kipish_m/features/enter/reset_password/views/reset_password_view.dart';
import 'package:kipish_m/features/main/home/bindings/home_binding.dart';
import 'package:kipish_m/features/main/home/views/home_view.dart';
import 'package:kipish_m/features/splash/bindings/splash_binding.dart';
import 'package:kipish_m/features/splash/views/splash_view.dart';

part 'app_routes.dart';
//это роутер, тут странички приложения (отдельные)
//логика роутинга такая:
//у нас есть по факту одна страница HomeView внтури приложения (пока что, но возможно потом добавится еще, если будут экраны вне нав бара), и LoginSigninView
//страницы в навбаре будут переключатся вручную, в контроллере HomeView, а также контроллеры страниц будут там вручную удалятся, чтобы не срать в память
// все экраны вне навбара будут переключаться через роутер, и контроллеры будут удаляться автоматически (а если не будут, то мы их удалим!!)

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SIGNIN,
      page: () => LoginSigninView(),
      binding: LoginSigninBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
