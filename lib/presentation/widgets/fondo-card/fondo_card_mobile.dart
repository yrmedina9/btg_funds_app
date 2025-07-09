import 'package:flutter/material.dart';
import 'package:btg_funds_app/core/models/fondo_model.dart';
import 'fondo_card_header.dart';
import 'fondo_card_info.dart';
import 'fondo_card_button.dart';

class FondoCardMobile extends StatelessWidget {
  final Fondo fondo;
  final String formattedAmount;

  const FondoCardMobile({super.key, required this.fondo, required this.formattedAmount});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FondoCardHeader(nombre: fondo.nombre, fontSize: 16),
            const SizedBox(height: 10),
            FondoCardInfo(formattedAmount: formattedAmount, categoria: fondo.categoria.name),
            const SizedBox(height: 12),
            FondoCardButton(fondo: fondo),
          ],
        ),
      ),
    );
  }
}
