import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:btg_funds_app/presentation/screens/fondos_screen.dart';
import 'package:btg_funds_app/presentation/screens/historial_screen.dart';
import 'package:btg_funds_app/presentation/providers/usuario_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [FondosScreen(), HistorialScreen()];

  @override
  Widget build(BuildContext context) {
    final saldo = ref.watch(usuarioProvider).saldo;
    final formattedSaldo =
        '\$ ${NumberFormat('#,##0', 'es_CO').format(saldo)}';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fondos BTG'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Text(
                'Saldo: $formattedSaldo',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Fondos',
          ),
          NavigationDestination(icon: Icon(Icons.history), label: 'Historial'),
        ],
      ),
    );
  }
}
