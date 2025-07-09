import 'package:flutter/material.dart';
import 'package:btg_funds_app/core/models/fondo_model.dart';
import 'fondo_card_header.dart';
import 'fondo_card_info.dart';
import 'fondo_card_button.dart';

class FondoCardTabletDesktop extends StatelessWidget {
  final Fondo fondo;
  final String formattedAmount;

  const FondoCardTabletDesktop({super.key, required this.fondo, required this.formattedAmount});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(13),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FondoCardHeader(nombre: fondo.nombre, fontSize: 18),
                  const SizedBox(height: 10),
                  FondoCardInfo(formattedAmount: formattedAmount, categoria: fondo.categoria.name),
                ],
              ),
              FondoCardButton(fondo: fondo),
            ],
          ),
        ),
      ),
    );
  }
}
