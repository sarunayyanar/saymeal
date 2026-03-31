import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import '../widgets/macro_widgets.dart';
import '../widgets/meal_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background.withOpacity(0.8),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuCjxvnNd9awBhnid_Jc8UxAA69fifJGDukuSAAGXthJnWjakd8EGjEqnz1A2WJnSuv6vyYvqMbrR263kQtNykOesYJBvHxUhaftT0_iXX-erBoRETwxtDgi0klPymJR8IvRn-vn4wKNDDkiBplJKJi91aYv3R2pRDL4FIbowOTqC0e4sYsCyePWB3woHp6cchAdyUkg2zBC8SzFFjZDdAMw_rzIkBQL7Up_Px0jTZJc0Q1wz6xMNVowFnjdAOSrj4ZqkKW-jp0JYnkJ'),
          ),
        ),
        title: Text(
          'Today, Oct 24',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          children: [
            const Center(
              child: MacroProgressRing(
                progress: 0.725,
                calories: '1,450',
                goal: '2,000',
                left: '550',
              ),
            ),
            const SizedBox(height: 48),
            Row(
              children: const [
                Expanded(child: MacroCard(title: 'Protein', current: 90, goal: 150)),
                SizedBox(width: 16),
                Expanded(child: MacroCard(title: 'Carbs', current: 120, goal: 250)),
                SizedBox(width: 16),
                Expanded(child: MacroCard(title: 'Fat', current: 45, goal: 65)),
              ],
            ),
            const SizedBox(height: 48),
            _MealSection(
              title: 'Breakfast',
              calories: '340 kcal',
              meals: [
                MealCard(
                  title: 'Oatmeal & Berries',
                  calories: '340 kcal',
                  macros: 'P: 12g • C: 45g • F: 6g',
                  imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCMnGKJN3-EfVdzrGi-3Vwh_2858mC-PlyFl-tfjufZAhYP3oCvjb5OxemNybD6Fif1M2N3PLqarzxFoSYAGg_y1x6KJ6AqNH5qK0dEZ-Oetz8frPFlboNWH56VmyWeCowwsdri9qVB70xIm9YDtdQaqhM1IzLZx0-GyJfCS_-B9gE_3Sac4Zr2UTHnjDXK61Vypk7eHIdACiwdAdfMcNVnSdJv1G3yOjKtyiYygaLLcIY3SBQ_OsO0xQ-bDN1_cBoYQhux7_hM9eZz',
                  onTap: () {},
                ),
              ],
            ),
            _MealSection(
              title: 'Lunch',
              calories: '520 kcal',
              meals: [
                MealCard(
                  title: 'Quinoa Power Salad',
                  calories: '520 kcal',
                  macros: 'P: 24g • C: 62g • F: 18g',
                  imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCmnxuOkuV69nHJ0mw8mef9mEhFufWjukQNH_EYml0z-v1aad2P8vqx1L8QSgSBvFjH_BYZ8MsypQD2NOg0wuuZY3JS5V36ym1gtvZa5T3AWiPLDT9Du7ZfMvjQCU-6XrOFANRQ2XoYMs4TrwOneSGjU7huSJD28lNj3l4DlHQCxHQgU5liqFtEQWWUKEr9d-fidIBNftsdccEAO2FcZtQldkJVjR0jY-GIEXQm85O-9zKp9N4RjqzyVBieOhTWcUv628IBdIiJoCRP',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MealSection extends StatelessWidget {
  final String title;
  final String calories;
  final List<Widget> meals;

  const _MealSection({
    required this.title,
    required this.calories,
    required this.meals,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              Text(
                calories,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...meals,
        ],
      ),
    );
  }
}
