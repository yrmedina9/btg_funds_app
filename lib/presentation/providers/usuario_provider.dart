import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:btg_funds_app/core/models/usuario_model.dart';

final usuarioProvider = StateProvider<Usuario>((ref) {
  return Usuario(saldo: 500000); // Saldo inicial
});
