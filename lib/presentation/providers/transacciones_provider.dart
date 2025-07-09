import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:btg_funds_app/core/models/transaccion_model.dart';

final transaccionesProvider = StateProvider<List<Transaccion>>((ref) {
  return [];
});
