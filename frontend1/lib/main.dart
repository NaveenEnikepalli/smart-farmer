import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'providers/app_provider.dart';
import 'providers/mandi_prices_provider.dart';
import 'providers/fertilizer_provider.dart';
import 'screens/home_screen.dart';
import 'screens/mandi_prices_screen.dart';
import 'screens/fertilizer_guide_screen.dart';
import 'screens/price_trends_screen.dart';
import 'screens/chatbot_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => MandiPricesProvider()),
        ChangeNotifierProvider(create: (_) => FertilizerProvider()),
      ],
      child: MaterialApp.router(
        title: 'Smart Farming App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.light,
          ),
        ),
        routerConfig: _router,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/mandi-prices',
      builder: (context, state) => const MandiPricesScreen(),
    ),
    GoRoute(
      path: '/fertilizer-guide',
      builder: (context, state) => const FertilizerGuideScreen(),
    ),
    GoRoute(
      path: '/price-trends',
      builder: (context, state) => const PriceTrendsScreen(),
    ),
    GoRoute(
      path: '/chatbot',
      builder: (context, state) => const ChatbotScreen(),
    ),
  ],
);