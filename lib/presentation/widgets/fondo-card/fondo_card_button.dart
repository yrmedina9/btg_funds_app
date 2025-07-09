import 'package:flutter/material.dart';
import 'package:btg_funds_app/core/models/fondo_model.dart';
import 'package:btg_funds_app/presentation/screens/suscripcion_screen.dart';

class FondoCardButton extends StatelessWidget {
  final Fondo fondo;

  const FondoCardButton({super.key, required this.fondo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => SuscripcionScreen(fondo: fondo),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 0, 28, 57),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
        child: const Text('Suscribirse'),
      ),
    );
  }
}
