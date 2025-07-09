import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:btg_funds_app/core/models/fondo_model.dart';
import 'package:btg_funds_app/core/models/transaccion_model.dart';
import 'package:btg_funds_app/presentation/providers/transacciones_provider.dart';
import 'package:btg_funds_app/presentation/providers/usuario_provider.dart';

import '../../core/models/usuario_model.dart';

class SuscripcionScreen extends ConsumerStatefulWidget {
  final Fondo fondo;

  const SuscripcionScreen({super.key, required this.fondo});

  @override
  ConsumerState<SuscripcionScreen> createState() => _SuscripcionScreenState();
}

class _SuscripcionScreenState extends ConsumerState<SuscripcionScreen> {
  String? metodoNotificacion;

  void _suscribirse() {
    final usuario = ref.read(usuarioProvider);
    final fondo = widget.fondo;

    if (usuario.saldo < fondo.montoMinimo) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Saldo insuficiente para suscribirse.')),
      );
      return;
    }

    if (metodoNotificacion == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Seleccione un método de notificación.')),
      );
      return;
    }

    ref
        .read(usuarioProvider.notifier)
        .update((u) => Usuario(saldo: u.saldo - fondo.montoMinimo));

    final nueva = Transaccion(
      fondoId: fondo.id,
      fondoNombre: fondo.nombre,
      monto: fondo.montoMinimo,
      tipo: TipoTransaccion.suscripcion,
      fecha: DateTime.now(),
    );

    final historial = ref.read(transaccionesProvider);
    ref.read(transaccionesProvider.notifier).state = [...historial, nueva];

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Suscripción exitosa a ${fondo.nombre}')),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final fondo = widget.fondo;
    final saldo = ref.watch(usuarioProvider).saldo;
    final formattedMonto =
        '\$ ${NumberFormat('#,##0', 'es_CO').format(fondo.montoMinimo)}';
    final formattedSaldo = '\$ ${NumberFormat('#,##0', 'es_CO').format(saldo)}';

    return Scaffold(
      appBar: AppBar(title: Text('Suscribirse a ${fondo.nombre}')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Monto mínimo: $formattedMonto'),
              Text('Tu saldo actual: $formattedSaldo'),
              const SizedBox(height: 24),
              const Text('Método de notificación:'),
              ListTile(
                title: const Text('Email'),
                leading: Radio<String>(
                  value: 'email',
                  groupValue: metodoNotificacion,
                  onChanged: (value) =>
                      setState(() => metodoNotificacion = value),
                ),
              ),
              ListTile(
                title: const Text('SMS'),
                leading: Radio<String>(
                  value: 'sms',
                  groupValue: metodoNotificacion,
                  onChanged: (value) =>
                      setState(() => metodoNotificacion = value),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _suscribirse,
                  child: const Text('Confirmar suscripción'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
