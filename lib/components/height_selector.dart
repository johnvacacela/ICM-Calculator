import 'package:flutter/material.dart';
import 'package:imc_calculator/core/text_styles.dart';
import 'package:imc_calculator/core/app_colors.dart';

class HeightSelector extends StatefulWidget {
  final double initialHeight;
  final Function(double) onHeightChanged;

  const HeightSelector({
    super.key,
    required this.initialHeight,
    required this.onHeightChanged,
  });

  @override
  State<HeightSelector> createState() => HeightSelectorState();
}

class HeightSelectorState extends State<HeightSelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text("Altura".toUpperCase(), style: TextStyles.bodyText),
            ),
            Text(
              "${widget.initialHeight.toStringAsFixed(0)} cm",
              style: TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
            Slider(
              value: widget.initialHeight,
              onChanged: (newHeight) {
                widget.onHeightChanged(newHeight);
              },
              min: 100,
              max: 220,
              divisions: 120, // Saltos que se puede dar!
              label: "${widget.initialHeight.toStringAsFixed(0)} cm",
              activeColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
