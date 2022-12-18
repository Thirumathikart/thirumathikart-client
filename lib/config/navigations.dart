import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:thirumathikart_app/bindings/auth_binding.dart';
import 'package:thirumathikart_app/bindings/home_bindings.dart';
import 'package:thirumathikart_app/bindings/main_binding.dart';
import 'package:thirumathikart_app/bindings/product_detail_bindings.dart';
import 'package:thirumathikart_app/bindings/products_binding.dart';
import 'package:thirumathikart_app/bindings/profile_page_binding.dart';
import 'package:thirumathikart_app/bindings/splash_binding.dart';
import 'package:thirumathikart_app/bindings/login_binding.dart';
import 'package:thirumathikart_app/bindings/register_binding.dart';
import 'package:thirumathikart_app/bindings/cart_binding.dart';
import 'package:thirumathikart_app/models/prodcut_response.dart';
import 'package:thirumathikart_app/views/auth.dart';
import 'package:thirumathikart_app/views/home.dart';
import 'package:thirumathikart_app/views/main_page.dart';
import 'package:thirumathikart_app/views/privacy_policy.dart';
import 'package:thirumathikart_app/views/product_detail.dart';
import 'package:thirumathikart_app/views/products.dart';
import 'package:thirumathikart_app/views/profile.dart';
import 'package:thirumathikart_app/views/register_safe.dart';
import 'package:thirumathikart_app/views/splash.dart';
import 'package:thirumathikart_app/views/login.dart';
import 'package:thirumathikart_app/views/cart.dart';
import 'package:thirumathikart_app/constants/navigation_routes.dart';
import 'package:thirumathikart_app/views/term_condition.dart';
import 'package:thirumathikart_app/bindings/orders_binding.dart';
import 'package:thirumathikart_app/views/orders_page.dart';

class NavigationPages {
  static List<GetPage<dynamic>> getPages() => [
        GetPage(
          name: NavigationRoutes.main,
          page: () => const Main(),
          binding: MainBindings(),
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
          page: () => const ProfilePage(),
          binding: ProfilePageBindings(),
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
          page: () => const RegisterSafePage(),
          binding: RegisterBindings(),
        ),
        GetPage(
          name: NavigationRoutes.productsRoute,
          page: () => const Products(),
          arguments: String,
          binding: ProductsBindings(),
        ),
        GetPage(
          name: NavigationRoutes.productDetailRoute,
          page: () => const ProductDetail(),
          arguments: ProductResponse,
          binding: ProductDetialBindings(),
        ),
        GetPage(
          name: NavigationRoutes.cartRoute,
          page: () => const CartPage(),
          binding: CartBindings(),
        ),
        GetPage(name: NavigationRoutes.tcroute, page: () => const Termspage()),
        GetPage(
            name: NavigationRoutes.privpolicyroute,
            page: () => const Privacypage()),
        GetPage(
          name: NavigationRoutes.myOrdersRoute,
          page: () => const OrdersPage(),
          arguments: List<Product>,
          binding: OrdersBindings(),
        ),
      ];
}
