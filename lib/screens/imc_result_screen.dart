import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class IMCResultScreen extends StatelessWidget {
  final double height;
  final int weight;
  const IMCResultScreen({
    super.key,
    required this.height,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    double fixedHeight = height / 100;
    double imcResult = weight / (fixedHeight * fixedHeight);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("Resultado IMC"),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Tu IMC es: ",
              style: TextStyle(
                fontSize: 38,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 32),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.backgroundComponent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: 
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("NORMAL", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white),),
                      Text(imcResult.toStringAsFixed(2) , style: TextStyle(fontSize: 76, color: Colors.white, fontWeight: FontWeight.bold),),
                      Text("Descripción", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400, color: Colors.white))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  backgroundColor: WidgetStatePropertyAll(AppColors.primary),
                ),
                child: Text("Finalizar", style: TextStyles.bodyText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
