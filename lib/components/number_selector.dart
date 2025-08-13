import 'package:flutter/material.dart';
import 'package:imc_calculator/core/text_styles.dart';
import 'package:imc_calculator/core/app_colors.dart';

class NumberSelector extends StatefulWidget {
  final String title;
  final Function() onIncrement;
  final Function() onDecrement;
  final int value;

  const NumberSelector({
    super.key,
    required this.title,
    required this.onIncrement,
    required this.onDecrement,
    required this.value,
  });

  @override
  State<NumberSelector> createState() => _NumberSelector();
}

class _NumberSelector extends State<NumberSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(widget.title, style: TextStyles.bodyText),
              Text(
                widget.value.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: () {
                      widget.onDecrement();
                    },
                    shape: CircleBorder(),
                    backgroundColor: AppColors.primary,
                    child: Icon(Icons.remove, color: Colors.white),
                  ),
                  SizedBox(width: 16),
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: () {
                      widget.onIncrement();
                    },
                    shape: CircleBorder(),
                    backgroundColor: AppColors.primary,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
