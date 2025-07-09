import 'package:flutter/material.dart';

class FondoCardHeader extends StatelessWidget {
  final String nombre;
  final double fontSize;

  const FondoCardHeader({super.key, required this.nombre, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.account_balance_wallet_rounded, color: Colors.green[700], size: 28),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            nombre,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: fontSize,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
