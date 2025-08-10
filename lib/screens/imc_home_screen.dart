import 'package:flutter/material.dart';
import 'package:imc_calculator/components/gender_selector.dart';

class IMCHomeScreen extends StatefulWidget {
  const IMCHomeScreen({super.key});

  @override
  State<IMCHomeScreen> createState() => _IMCHomeScreen();
}

class _IMCHomeScreen extends State<IMCHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
        GenderSelector()
      ],
    );
  }
}
