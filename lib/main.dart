import "package:flutter/foundation.dart";
import "package:flutter/gestures.dart";
import "package:device_preview/device_preview.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:provider/provider.dart";
import "package:stylish/providers/cart_provider.dart";
import "package:stylish/providers/wishlist_provider.dart";
import "package:stylish/screens/forgotPassword/forgot_password.dart";
import "package:stylish/screens/get_started_screen.dart";
import "package:stylish/screens/main_screen.dart";
import "package:stylish/screens/login/login_screen.dart";
import "package:stylish/screens/splash/splash_screen.dart";
import "package:stylish/screens/product_details/product_details_screen.dart";
import "package:stylish/screens/cart/cart_screen.dart";
import "package:stylish/screens/checkout/checkout_profile_screen.dart";
import "package:stylish/screens/checkout/checkout_summary_screen.dart";
import "package:stylish/screens/checkout/checkout_payment_screen.dart";

import "screens/signup/sign_up_screen.dart";

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(
    DevicePreview(
      enabled: kIsWeb,
      defaultDevice: Devices.ios.iPhone16ProMax,
      builder: (context) => const Stylish(),
    ),
  );
}

class Stylish extends StatelessWidget {
  const Stylish({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown,
          },
        ),
        routes: {
          "/": (context) => const SplashScreen(),
          "/login": (context) => const LoginScreen(),
          "/signup": (context) => const SignUpScreen(),
          "/home": (context) => const MainScreen(),
          "/forgot": (context) => const ForgotPassword(),
          "/start": (context) => const GetStartedScreen(),
          "/product_details": (context) => const ProductDetailsScreen(),
          "/cart": (context) => const CartScreen(),
          "/checkout_profile": (context) => const CheckoutProfileScreen(),
          "/checkout_summary": (context) => const CheckoutSummaryScreen(),
          "/checkout_payment": (context) => const CheckoutPaymentScreen(),
        },
      ),
    );
  }
}


