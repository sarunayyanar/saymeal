import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import '../widgets/meal_widgets.dart';

class VoiceLoggingScreen extends StatefulWidget {
  const VoiceLoggingScreen({Key? key}) : super(key: key);

  @override
  State<VoiceLoggingScreen> createState() => _VoiceLoggingScreenState();
}

class _VoiceLoggingScreenState extends State<VoiceLoggingScreen> {
  bool _isListening = true;
  String _transcript = "2 eggs, 1 dosa, and coffee with milk";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background.withOpacity(0.8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.onSurface),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Voice Logging',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'ACTIVE LISTENING',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Tell me what you ate',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 64),
              VoiceMicButton(
                isListening: _isListening,
                onTap: () {
                  setState(() {
                    _isListening = !_isListening;
                  });
                },
              ),
              const SizedBox(height: 64),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  '"$_transcript"',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              _DetectedItemCard(
                name: '2 Large Eggs',
                calories: '140 kcal',
                isConfirmed: true,
              ),
              const SizedBox(height: 16),
              _DetectedItemCard(
                name: 'Masala Dosa',
                calories: '280 kcal',
                isConfirmed: true,
              ),
              const SizedBox(height: 16),
              _DetectedItemCard(
                name: 'Coffee with Milk',
                calories: '65 kcal',
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAG0wUu4fCKvG9DFOAOxE8z_ba0ZXauI7nd_gqEbe7EBSCbDYcZmyio0v3N41d0BL_sCauktuWPQcUA7JFt9MqgkRDM8jeIMY8yKniAdco3M09nc0_z6hAztN6nMU7pOL3FBeXgDyo2MsQ_-FN-eN0nk0izDJsinCIhLEpbdJIRJqZbeZ8NMB9VhMC5gMs3F2qUOv5dREhzfnNeIxmYG6chbmtGEdhk4ZC_U4qPlhJbmy3AtEro6F-cXBLd_w6EwySY5sDiK6hE68a3',
                isConfirmed: true,
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward),
          label: const Text('Log All Items'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class _DetectedItemCard extends StatelessWidget {
  final String name;
  final String calories;
  final String? imageUrl;
  final bool isConfirmed;

  const _DetectedItemCard({
    required this.name,
    required this.calories,
    this.imageUrl,
    required this.isConfirmed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
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
            children: [
              if (imageUrl != null)
                Container(
                  width: 48,
                  height: 48,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      calories,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              if (isConfirmed)
                const Icon(Icons.check_circle, color: AppColors.primaryContainer),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Edit'),
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.surfaceContainer,
                    foregroundColor: AppColors.onSurfaceVariant,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Confirm'),
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primaryContainer.withOpacity(0.1),
                    foregroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
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
