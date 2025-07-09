import 'package:flutter/material.dart';

class FondoCardInfo extends StatelessWidget {
  final String formattedAmount;
  final String categoria;

  const FondoCardInfo({super.key, required this.formattedAmount, required this.categoria});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Monto mínimo: $formattedAmount'),
        Text('Categoría: $categoria'),
      ],
    );
  }
}
