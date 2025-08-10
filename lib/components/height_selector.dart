import 'package:flutter/material.dart';
import 'package:imc_calculator/core/text_styles.dart';
import 'package:imc_calculator/core/app_colors.dart';

class HeightSelector extends StatefulWidget {
  const HeightSelector({super.key});

  @override
  State<HeightSelector> createState() => HeightSelectorState();
}

class HeightSelectorState extends State<HeightSelector> {
  double selectedHeight = 170.0; // Default height in cm
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
            Text("Altura".toUpperCase(), style: TextStyles.bodyText,),
            Text("${selectedHeight.toStringAsFixed(0)} cm", style: TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.bold
            ),),
            Slider(
              value: selectedHeight,
              onChanged: (newHeight) {
                setState(() {
                  selectedHeight = newHeight;
                });
              },
              min: 100,
              max: 220,
              divisions: 120, // Saltos que se puede dar!
              label: "${selectedHeight.toStringAsFixed(0)} cm",
              activeColor: AppColors.primary,
            )
          ],
        ),
      ),
    );
  }
}