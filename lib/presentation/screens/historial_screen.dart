import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:btg_funds_app/presentation/providers/transacciones_provider.dart';
import 'package:btg_funds_app/presentation/providers/usuario_provider.dart';
import 'package:btg_funds_app/presentation/widgets/fondo-card/transaccion_item.dart';
import 'package:btg_funds_app/core/models/transaccion_model.dart';

import '../../core/models/usuario_model.dart';

class HistorialScreen extends ConsumerWidget {
  const HistorialScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transacciones = ref.watch(transaccionesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Historial de transacciones')),
      body: SafeArea(
        child: transacciones.isEmpty
            ? const Center(child: Text('No hay transacciones aún.'))
            : Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 32,
                ),
                child: ListView.separated(
                  itemCount: transacciones.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (_, index) {
                    final transaccion = transacciones[index];

                    return TransaccionItem(
                      transaccion: transaccion,
                      onCancelar:
                          transaccion.tipo == TipoTransaccion.suscripcion &&
                              !transacciones.any(
                                (t) =>
                                    t.fondoId == transaccion.fondoId &&
                                    t.tipo == TipoTransaccion.cancelacion,
                              )
                          ? () {
                              ref
                                  .read(usuarioProvider.notifier)
                                  .update(
                                    (u) => Usuario(
                                      saldo: u.saldo + transaccion.monto,
                                    ),
                                  );

                              final nueva = Transaccion(
                                fondoId: transaccion.fondoId,
                                fondoNombre: transaccion.fondoNombre,
                                monto: transaccion.monto,
                                tipo: TipoTransaccion.cancelacion,
                                fecha: DateTime.now(),
                              );

                              ref.read(transaccionesProvider.notifier).state = [
                                ...ref.read(transaccionesProvider),
                                nueva,
                              ];

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Cancelación exitosa'),
                                ),
                              );
                            }
                          : null,
                    );
                  },
                ),
              ),
      ),
    );
  }
}
