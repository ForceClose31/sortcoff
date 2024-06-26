import 'package:flutter/material.dart';
import 'package:sortcoff/views/keuangan/views/keuangan.dart';
import 'package:sortcoff/views/panen/views/panen.dart';
import 'package:sortcoff/views/sortir/views/machineact.dart';

class ServiceButtons extends StatelessWidget {
  final VoidCallback onPanenPressed;
  final VoidCallback onSortirPressed;
  final VoidCallback onKeuanganPressed;

  const ServiceButtons({
    super.key,
    required this.onPanenPressed,
    required this.onSortirPressed,
    required this.onKeuanganPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildServiceButton(
          icon: 'assets/images/icon/panen.png',
          label: 'Panen',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PanenKopi()),
            );
          },
        ),
        const SizedBox(width: 50),
        _buildServiceButton(
          icon: 'assets/images/icon/pemilahan.png',
          label: 'Pemilahan',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyMachineAct()),
            );
          },
        ),
        const SizedBox(width: 50),
        _buildServiceButton(
          icon: 'assets/images/icon/keuangan.png',
          label: 'Keuangan',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FinanceRecordingScreen()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildServiceButton({
    required String icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: const Size(63, 83), // Set the minimum size of the button
          ),
          child: Image.asset(
            icon,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
