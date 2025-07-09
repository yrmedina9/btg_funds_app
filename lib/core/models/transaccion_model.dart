enum TipoTransaccion { suscripcion, cancelacion }

class Transaccion {
  final int fondoId;
  final String fondoNombre;
  final int monto;
  final TipoTransaccion tipo;
  final DateTime fecha;

  const Transaccion({
    required this.fondoId,
    required this.fondoNombre,
    required this.monto,
    required this.tipo,
    required this.fecha,
  });
}
