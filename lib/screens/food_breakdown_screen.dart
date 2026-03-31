import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class FoodBreakdownScreen extends StatelessWidget {
  const FoodBreakdownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Today, Oct 24'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuCjxvnNd9awBhnid_Jc8UxAA69fifJGDukuSAAGXthJnWjakd8EGjEqnz1A2WJnSuv6vyYvqMbrR263kQtNykOesYJBvHxUhaftT0_iXX-erBoRETwxtDgi0klPymJR8IvRn-vn4wKNDDkiBplJKJi91aYv3R2pRDL4FIbowOTqC0e4sYsCyePWB3woHp6cchAdyUkg2zBC8SzFFjZDdAMw_rzIkBQL7Up_Px0jTZJc0Q1wz6xMNVowFnjdAOSrj4ZqkKW-jp0JYnkJ'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DETAILED MEAL ANALYSIS',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Avocado Toast with Poached Egg',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '420',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w800,
                    fontSize: 56,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'TOTAL KCAL',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.grey[400],
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Container(
              height: 240,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: const DecorationImage(
                  image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuCOLUy9gNmkgoXee_6fGPJwKEPiQXfzsVBNo8e75hCI04KOg9UDN1TC2G3Q7ViODH7papVaxnR8MUiVrRkysp8_WdOpCorKv4qVc0EEbNyTuDLfIQi2ZLXmsxbc-OrnXATkLXK-I0rXo4nR8QZIJFt6v654A1NRp3U03xHq7WSXm-8kXY4tXOLaiZHqr5LZ4t4vW09wcI7Xu-GmIt0QlgPrKT69PIQ6jEijZK4AAkrDgN4fnFbZSRXzc9A9kYLDfk3K9TAIfvINKKsO'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.eco, color: AppColors.primary, size: 20),
                            const SizedBox(width: 8),
                            Text(
                              'HIGH IN HEALTHY FATS',
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Icon(Icons.star, color: AppColors.primary, size: 14),
                            Icon(Icons.star, color: AppColors.primary, size: 14),
                            Icon(Icons.star, color: AppColors.primary, size: 14),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 48),
            const Row(
              children: [
                Expanded(child: _MacroRing(title: 'Protein', grams: '18g', progress: 0.3)),
                SizedBox(width: 24),
                Expanded(child: _MacroRing(title: 'Carbs', grams: '40g', progress: 0.5)),
                SizedBox(width: 24),
                Expanded(child: _MacroRing(title: 'Fat', grams: '12g', progress: 0.2)),
              ],
            ),
            const SizedBox(height: 48),
            _MicroNutrientCard(
              title: 'Fiber',
              value: '8g',
              progress: 0.32,
              subtitle: '32% of daily goal',
              color: AppColors.primary,
            ),
            const SizedBox(height: 16),
            _MicroNutrientCard(
              title: 'Sugar',
              value: '4g',
              progress: 0.12,
              subtitle: 'Low sugar content',
              color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}

class _MacroRing extends StatelessWidget {
  final String title;
  final String grams;
  final double progress;

  const _MacroRing({
    required this.title,
    required this.grams,
    required this.progress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 8,
                backgroundColor: AppColors.surfaceContainer,
                color: AppColors.primary,
                strokeCap: StrokeCap.round,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  grams,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  title.substring(0, min(title.length, 4)),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.grey[400],
                    fontSize: 8,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          title.toUpperCase(),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: AppColors.onSurfaceVariant,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}

class _MicroNutrientCard extends StatelessWidget {
  final String title;
  final String value;
  final double progress;
  final String subtitle;
  final Color color;

  const _MicroNutrientCard({
    required this.title,
    required this.value,
    required this.progress,
    required this.subtitle,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title.toUpperCase(),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.onSurfaceVariant,
                  letterSpacing: 2.0,
                ),
              ),
              Text(
                value,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 12,
              backgroundColor: AppColors.surfaceContainerLow,
              color: color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
