import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:btg_funds_app/core/models/fondo_model.dart';
import 'package:btg_funds_app/data/mocks/fondos_mock.dart';

import '../../core/extensions/fondo_extensions.dart';

final fondosProvider = Provider<List<Fondo>>((ref) {
  return fondosMock
      .map(
        (f) => Fondo(
          id: f.id,
          nombre: formatNombreFondo(f.nombre),
          montoMinimo: f.montoMinimo,
          categoria: f.categoria,
        ),
      )
      .toList();
});
