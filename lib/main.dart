import 'package:bw2_cart/controller/provider/Quantity.dart';
import 'package:bw2_cart/controller/provider/checkbox.dart';
import 'package:bw2_cart/controller/provider/like_provider.dart';
import 'package:bw2_cart/home/homepage.dart';
import 'package:bw2_cart/product_detaile/product_details_page.dart';
import 'package:bw2_cart/product_view/product_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final likedProductsProvider = LikedProductsProvider();
  await likedProductsProvider.initDatabase();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => likedProductsProvider),
         ChangeNotifierProvider(
      create: (_) => CheckboxProvider()),
      ChangeNotifierProvider(
       create: (context) => QuantityProvider(),)
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GoRouter _router = GoRouter(
    initialLocation: '/home', 
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => HomePage(),
      ),
       GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return ProductDetailsPage(
          id: extra['id'],
          imageUrl: extra['imageUrl'],
          title: extra['title'],
        );
      },
    ),
      GoRoute(
        path: '/cart',
        builder: (context, state) => const LikedProductsPage(),
      ),
    ],
    // redirect: (context, state) {
    //   // If the user is on a specific route, handle the back button behavior
    //   if (state.uri.toString() == '/home') {
    //     return null; // Allow the app to exit if on the home page
    //   } else {
    //     return null; // Let GoRouter handle back navigation normally
    //   }
    // },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}