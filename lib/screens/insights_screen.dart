import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../utils/app_theme.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({Key? key}) : super(key: key);

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
            Text(
              'WEEKLY SUMMARY',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Nutrition\nInsights',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 56,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Your dietary habits are evolving. This week shows a significant shift towards protein-rich meals.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 48),
            _WeeklyChart(),
            const SizedBox(height: 48),
            Row(
              children: [
                Expanded(child: _MacroBalanceDoughnut()),
                const SizedBox(width: 24),
                Expanded(child: _MacroLegend()),
              ],
            ),
            const SizedBox(height: 48),
            Text(
              'Personalized Feedback',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            const _FeedbackCard(
              title: 'Protein intake increased by 20% this week',
              description: 'Your muscle recovery metrics are likely to improve.',
              icon: Icons.trending_up,
              color: AppColors.primary,
            ),
            const SizedBox(height: 16),
            const _FeedbackCard(
              title: 'Your average calorie intake is within your goal',
              description: 'Consistency is key to sustainable health.',
              icon: Icons.verified,
              color: AppColors.primaryContainer,
            ),
          ],
        ),
      ),
    );
  }
}

class _WeeklyChart extends StatelessWidget {
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
            blurRadius: 40,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Weekly Calorie Intake',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Avg. 2,140 / 2,200 goal',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle, size: 14, color: AppColors.primary),
                    const SizedBox(width: 4),
                    Text(
                      'ON TRACK',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 48),
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 2500,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const days = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
                        if (value.toInt() >= 0 && value.toInt() < days.length) {
                          return Text(
                            days[value.toInt()],
                            style: TextStyle(color: Colors.grey[400], fontSize: 10),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),
                barGroups: [
                  _makeGroup(0, 1800),
                  _makeGroup(1, 2100),
                  _makeGroup(2, 2300, isToday: true),
                  _makeGroup(3, 1900),
                  _makeGroup(4, 2200),
                  _makeGroup(5, 1200),
                  _makeGroup(6, 800),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData _makeGroup(int x, double y, {bool isToday = false}) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: isToday ? AppColors.primary : AppColors.primaryContainer,
          width: 16,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
        ),
      ],
    );
  }
}

class _MacroBalanceDoughnut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
      ),
      child: PieChart(
        PieChartData(
          sectionsSpace: 0,
          centerSpaceRadius: 40,
          sections: [
            PieChartSectionData(
              color: AppColors.primaryContainer,
              value: 45,
              radius: 12,
              showTitle: false,
            ),
            PieChartSectionData(
              color: AppColors.primary,
              value: 30,
              radius: 12,
              showTitle: false,
            ),
            PieChartSectionData(
              color: AppColors.secondary,
              value: 25,
              radius: 12,
              showTitle: false,
            ),
          ],
        ),
      ),
    );
  }
}

class _MacroLegend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _LegendItem(color: AppColors.primaryContainer, title: 'Carbs', percent: '45%'),
        const SizedBox(height: 12),
        _LegendItem(color: AppColors.primary, title: 'Protein', percent: '30%', isHighlighted: true),
        const SizedBox(height: 12),
        _LegendItem(color: AppColors.secondary, title: 'Fats', percent: '25%'),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String title;
  final String percent;
  final bool isHighlighted;

  const _LegendItem({
    required this.color,
    required this.title,
    required this.percent,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: isHighlighted ? Border.all(color: AppColors.primary, width: 2) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
              const SizedBox(width: 12),
              Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
          Text(percent, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class _FeedbackCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const _FeedbackCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
        border: Border(left: BorderSide(color: color, width: 4)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: color),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
