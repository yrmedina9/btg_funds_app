import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:btg_funds_app/core/models/transaccion_model.dart';

class TransaccionItem extends StatelessWidget {
  final Transaccion transaccion;
  final VoidCallback? onCancelar;

  const TransaccionItem({
    super.key,
    required this.transaccion,
    this.onCancelar,
  });

  @override
  Widget build(BuildContext context) {
    final isSuscripcion = transaccion.tipo == TipoTransaccion.suscripcion;
    final formattedMonto =
        '\$ ${NumberFormat('#,##0', 'es_CO').format(transaccion.monto)}';

    final formattedFecha = DateFormat(
      'yyyy-MM-dd – kk:mm',
    ).format(transaccion.fecha);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nombre del fondo
            Text(
              transaccion.fondoNombre,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),

            // Monto y fecha
            Text('Monto: $formattedMonto'),
            Text('Fecha: $formattedFecha'),

            const SizedBox(height: 12),

            // Tipo y botón (en una fila)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isSuscripcion ? 'Suscripción' : 'Cancelación',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isSuscripcion ? Colors.green[700] : Colors.red[700],
                  ),
                ),
                if (isSuscripcion && onCancelar != null)
                  OutlinedButton(
                    onPressed: onCancelar,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFFD32F2F),
                      side: const BorderSide(color: Color(0xFFD32F2F)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    child: const Text('Cancelar'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
