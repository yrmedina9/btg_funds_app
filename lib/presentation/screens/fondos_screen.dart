import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:btg_funds_app/presentation/providers/fondos_provider.dart';
import 'package:btg_funds_app/presentation/widgets/fondo-card/fondo_card.dart';
import 'package:btg_funds_app/presentation/screens/historial_screen.dart';

import '../../utils/responsive_utils.dart';

class FondosScreen extends ConsumerWidget {
  const FondosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fondos = ref.watch(fondosProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fondos disponibles'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: 'Ver historial',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const HistorialScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          if (width < 768) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: fondos.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final fondo = fondos[index];
                return FondoCard(fondo: fondo);
              },
            );
          }

          final columns = getCrossAxisCount(width);
          final aspectRatio = getAspectRatio(width);

          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: GridView.builder(
                  itemCount: fondos.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 24,
                    childAspectRatio: aspectRatio,
                  ),
                  itemBuilder: (context, index) {
                    return FondoCard(fondo: fondos[index]);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
