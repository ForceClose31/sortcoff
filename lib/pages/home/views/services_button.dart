import 'package:flutter/material.dart';
import 'package:sortcoff/pages/panen/views/panen.dart';
import 'package:sortcoff/pages/sortir/views/machineact.dart';

class ServiceButtons extends StatelessWidget {
  final VoidCallback onTeleponPressed;
  final VoidCallback onPesanPressed;
  final VoidCallback onEmailPressed;

  const ServiceButtons({
    super.key,
    required this.onTeleponPressed,
    required this.onPesanPressed,
    required this.onEmailPressed,
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
          onPressed: onEmailPressed,
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
            minimumSize: Size(63, 83), // Set the minimum size of the button
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
