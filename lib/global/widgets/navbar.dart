import 'package:flutter/material.dart';

class Navigasi extends StatelessWidget {
  final String currentPage;

  const Navigasi({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildNavItem(context, Icons.home, '/Beranda', 'Beranda'),
          buildNavItem(
              context, Icons.account_balance_wallet, '/Keuangan', 'Keuangan'),
          buildNavItem(context, Icons.person, '/Profil', 'Profil'),
        ],
      ),
    );
  }

  Widget buildNavItem(
      BuildContext context, IconData iconData, String route, String label) {
    final bool isSelected = route == currentPage;

    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              if (!isSelected) {
                Navigator.pushReplacementNamed(context, route);
              }
            },
            icon: Icon(
              iconData,
              color: isSelected ? const Color(0xFF674633) : Colors.grey,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? const Color(0xFF674633) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
