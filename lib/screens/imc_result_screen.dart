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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        getTitleByIMC(imcResult),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: getColorByIMC(imcResult),
                        ),
                      ),
                      Text(
                        imcResult.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 76,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          getDescriptionByIMC(imcResult),
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
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

  Color getColorByIMC(double imcResult) {
    return switch (imcResult) {
      < 18.5 => Colors.blue, //IMC bajo
      < 24.9 => Colors.green, //IMC normal
      < 29.9 => Colors.orange, //IMC sobrepeso
      _ => Colors.red, //IMC obesidad grado 1
    };
  }

  String getTitleByIMC(double imcResult) {
    return switch (imcResult) {
      < 18.5 => "Bajo peso",
      < 24.9 => "Peso normal",
      < 29.9 => "Sobrepeso",
      _ => "Obesidad",
    };
  }

  String getDescriptionByIMC(double imcResult) {
    return switch (imcResult) {
      < 18.5 =>
        "Tu IMC indica que tienes un bajo peso. Es recomendable consultar a un profesional de la salud.",
      < 24.9 => "Tu IMC está en el rango normal. ¡Buen trabajo!",
      < 29.9 =>
        "Tu IMC indica sobrepeso. Considera adoptar hábitos más saludables.",
      _ => "Tu IMC indica obesidad. Es importante buscar asesoramiento médico.",
    };
  }
}
