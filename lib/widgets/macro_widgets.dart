import 'dart:math';
import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class MacroProgressRing extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final String calories;
  final String goal;
  final String left;

  const MacroProgressRing({
    required this.progress,
    required this.calories,
    required this.goal,
    required this.left,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 280,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(280, 280),
            painter: _RingPainter(progress: progress),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'CALORIE BALANCE',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Colors.grey[400],
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                calories,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 56,
                  height: 1.0,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'of $goal kcal goal',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '$left LEFT',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  final double progress;
  _RingPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;
    final strokeWidth = 14.0;

    final backgroundPaint = Paint()
      ..color = AppColors.surfaceContainer
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, backgroundPaint);

    final progressPaint = Paint()
      ..shader = AppColors.primaryGradient.createShader(
          Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class MacroCard extends StatelessWidget {
  final String title;
  final double current;
  final double goal;

  const MacroCard({
    required this.title,
    required this.current,
    required this.goal,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final progress = (current / goal).clamp(0.0, 1.0);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Colors.grey[400],
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${current.toInt()}g',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' / ${goal.toInt()}g',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: AppColors.surfaceContainer,
                color: AppColors.primaryContainer,
                minHeight: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
