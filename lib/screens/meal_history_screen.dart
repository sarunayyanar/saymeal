import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import '../widgets/meal_widgets.dart';

class MealHistoryScreen extends StatelessWidget {
  const MealHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuCjxvnNd9awBhnid_Jc8UxAA69fifJGDukuSAAGXthJnWjakd8EGjEqnz1A2WJnSuv6vyYvqMbrR263kQtNykOesYJBvHxUhaftT0_iXX-erBoRETwxtDgi0klPymJR8IvRn-vn4wKNDDkiBplJKJi91aYv3R2pRDL4FIbowOTqC0e4sYsCyePWB3woHp6cchAdyUkg2zBC8SzFFjZDdAMw_rzIkBQL7Up_Px0jTZJc0Q1wz6xMNVowFnjdAOSrj4ZqkKW-jp0JYnkJ'),
          ),
        ),
        title: Text(
          'Today, Oct 24',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SummaryCard(),
            const SizedBox(height: 48),
            _HistorySection(
              title: 'Breakfast',
              time: '08:15 AM',
              meal: MealCard(
                title: 'Avocado Poached Toast',
                calories: '420 kcal',
                macros: 'P: 14g • C: 32g • F: 22g',
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuB_f3wbS0hcpR_1wmhe1K8poQsyCiQEpwY3mmnFral3rWLzKcWpfnv9OJS54B0Xdo6boLXbxFGVhwFOXZExOYzZL963o2Ab6qH1ENWbCENsKO9gsKTa3JoekCrOmtDoFgpbAmDSZI1iM533hXCdo-8OzKHVIEric7a0DlFQ9sxbSz2T86KBiv3wzwY5a4yC-wK7KLQAVPQ8gP55II_pkoUjpGtu-yR8RSkBgLfuAwKvukhKm8j0eB6HrMceo16ce9ucA6d8Tb8ZefFR',
                onTap: () {},
              ),
            ),
            const SizedBox(height: 32),
            _HistorySection(
              title: 'Lunch',
              time: '01:30 PM',
              meal: MealCard(
                title: 'Quinoa Power Salad',
                calories: '350 kcal',
                macros: 'P: 20g • C: 45g • F: 12g',
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuC6d7r5Uyn-C08vUM_3mAWTNgvWzJn-ZXLpH7j-YZOXhFyxFtq6fjuiZMVUTn5TyQcoVECFJXhyl0q5z6C0xXMNZNcCRBX8HOg4a1KmpSlPFJVsyIgPATehNWXhU5lH-z8O75Tvdios_HMDasF_Wh9BKSBes17OE5OxLpexMdjX-oL9yNrmgqs6yfgEcopyYZzQeRKCKC4BhQl1IrwOTCc9PCO890Jem7FplzrjyuO3XDU7xYZHcmGVN5UREy8b5kOWV85CTtUcVB_A',
                onTap: () {},
              ),
            ),
            const SizedBox(height: 32),
            _HistorySection(
              title: 'Dinner',
              time: '07:45 PM',
              meal: MealCard(
                title: 'Seared Atlantic Salmon',
                calories: '580 kcal',
                macros: 'P: 42g • C: 12g • F: 32g',
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuACXoLWNAVMvVcF7yhBr08ocKoklPNGBCUseSZBREMbYFjxlIDtHvRFonE4-I_HGvYuwAIDZvrXI_EYQxYlDDoUDyV2p_TEciOYdWa1UHH9oxH9vDVJv5qAuhX1QEGgNR5FYimsG2Knp8SxqRSvmbmYE4MZm7zD6qdlet3iVpuid2XZ9sbbviwriy4zilRK64K24yPRTXiWNDyfV9TRscPObp_N04dioXLkDKQBExcUGi8wIEY8sxxLmVhacVgYXZ8J3LtrzIBJsnHc',
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TOTAL CONSUMED',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.grey[400],
                      letterSpacing: 2.0,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '1,840',
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 48,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'kcal',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(Icons.restaurant, color: AppColors.primary, size: 32),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            children: const [
              Expanded(child: _MacroSmall('Protein', '112g')),
              SizedBox(width: 12),
              Expanded(child: _MacroSmall('Carbs', '210g')),
              SizedBox(width: 12),
              Expanded(child: _MacroSmall('Fats', '54g')),
            ],
          ),
        ],
      ),
    );
  }
}

class _MacroSmall extends StatelessWidget {
  final String title;
  final String value;
  const _MacroSmall(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontSize: 8,
              color: Colors.grey[400],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _HistorySection extends StatelessWidget {
  final String title;
  final String time;
  final Widget meal;

  const _HistorySection({
    required this.title,
    required this.time,
    required this.meal,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              time,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        meal,
      ],
    );
  }
}
