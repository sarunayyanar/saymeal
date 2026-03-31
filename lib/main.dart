import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'utils/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/meal_history_screen.dart';
import 'screens/insights_screen.dart';
import 'screens/voice_logging_screen.dart';
import 'widgets/nav_widgets.dart';
import 'services/ai_service.dart';
import 'services/voice_service.dart';
import 'database/database_service.dart';

// Providers
final aiServiceProvider = Provider<AIService>((ref) => AIService(apiKey: dotenv.env['GEMINI_API_KEY'] ?? ''));
final voiceServiceProvider = ChangeNotifierProvider<VoiceService>((ref) => VoiceService());
final databaseServiceProvider = Provider<DatabaseService>((ref) => DatabaseService.instance);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(
    const ProviderScope(
      child: SayMealApp(),
    ),
  );
}

class SayMealApp extends StatelessWidget {
  const SayMealApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SayMeal',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainNavigationShell(),
    );
  }
}

class MainNavigationShell extends StatefulWidget {
  const MainNavigationShell({super.key});

  @override
  State<MainNavigationShell> createState() => _MainNavigationShellState();
}

class _MainNavigationShellState extends State<MainNavigationShell> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const InsightsScreen(), // Placeholder for Stats
    const SizedBox.shrink(), // FAB Placeholder
    const MealHistoryScreen(),
    const InsightsScreen(),
  ];

  void _onTap(int index) {
    if (index == 2) {
      // Open Voice Logging Screen as an overlay/modal
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const VoiceLoggingScreen(),
          fullscreenDialog: true,
        ),
      );
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
      extendBody: true,
    );
  }
}
