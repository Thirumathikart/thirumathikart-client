import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:thirumathikart_app/bindings/auth_binding.dart';
import 'package:thirumathikart_app/bindings/home_bindings.dart';
import 'package:thirumathikart_app/bindings/product_detail_bindings.dart';
import 'package:thirumathikart_app/bindings/products_binding.dart';
import 'package:thirumathikart_app/bindings/splash_binding.dart';
import 'package:thirumathikart_app/bindings/login_binding.dart';
import 'package:thirumathikart_app/bindings/register_binding.dart';
import 'package:thirumathikart_app/models/product.dart';
import 'package:thirumathikart_app/views/auth.dart';
import 'package:thirumathikart_app/views/home.dart';
import 'package:thirumathikart_app/views/product_detail.dart';
import 'package:thirumathikart_app/views/products.dart';
import 'package:thirumathikart_app/views/splash.dart';
import 'package:thirumathikart_app/views/login.dart';
import 'package:thirumathikart_app/views/register.dart';
import 'package:thirumathikart_app/constants/navigation_routes.dart';

class NavigationPages {
  static List<GetPage<dynamic>> getPages() => [
        GetPage(
          name: NavigationRoutes.main,
          page: () => const HomePage(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: NavigationRoutes.authRoute,
          page: () => const AuthPage(),
          binding: AuthBindings(),
        ),
        GetPage(
          name: NavigationRoutes.splashRoute,
          page: () => const SplashPage(),
          binding: SplashBindings(),
        ),
        // Replace with correspondings bindings and pages
        GetPage(
          name: NavigationRoutes.profileRoute,
          page: () => const HomePage(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: NavigationRoutes.wishlistRoute,
          page: () => const HomePage(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: NavigationRoutes.ordersRoute,
          page: () => const HomePage(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: NavigationRoutes.offersRoute,
          page: () => const HomePage(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: NavigationRoutes.aboutRoute,
          page: () => const HomePage(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: NavigationRoutes.feedbackRoute,
          page: () => const HomePage(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: NavigationRoutes.helpRoute,
          page: () => const HomePage(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: NavigationRoutes.tourRoute,
          page: () => const HomePage(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: NavigationRoutes.exploreRoute,
          page: () => const HomePage(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: NavigationRoutes.loginRoute,
          page: () => const LoginPage(),
          binding: LoginBindings(),
        ),
        GetPage(
          name: NavigationRoutes.registerRoute,
          page: () => const RegisterPage(),
          binding: RegisterBindings(),
        ),
        GetPage(
          name: NavigationRoutes.productsRoute,
          page: () => const Products(),
          arguments: List<Product>,
          binding: ProductsBindings(),
        ),
        GetPage(
          name: NavigationRoutes.productDetailRoute,
          page: () => const ProductDetail(),
          arguments: const [Product, List<Product>],
          binding: ProductDetialBindings(),
        ),
      ];
}
