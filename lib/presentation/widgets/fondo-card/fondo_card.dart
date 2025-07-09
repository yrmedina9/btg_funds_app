import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:btg_funds_app/core/models/fondo_model.dart';
import 'fondo_card_mobile.dart';
import 'fondo_card_tablet_desktop.dart';

class FondoCard extends StatelessWidget {
  final Fondo fondo;

  const FondoCard({super.key, required this.fondo});

  String get formattedAmount {
    final numberFormatted = NumberFormat('#,##0', 'es_CO').format(fondo.montoMinimo);
    return '\$ $numberFormatted';
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    if (isMobile) {
      return FondoCardMobile(fondo: fondo, formattedAmount: formattedAmount);
    } else {
      return FondoCardTabletDesktop(fondo: fondo, formattedAmount: formattedAmount);
    }
  }
}
