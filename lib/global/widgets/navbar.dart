import 'package:flutter/material.dart';

class Navigasi extends StatelessWidget {
  const Navigasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
    
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavItem(context, Icons.home, '/Beranda', 'Beranda'),
            buildNavItem(context, Icons.account_balance_wallet, '/Keuangan', 'Keuangan'),
            buildNavItem(context, Icons.person, '/Profil', 'Profil'),
          ],
        ),
      
    );
  }

  Widget buildNavItem(BuildContext context, IconData iconData, String route, String label) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, route);
            },
            icon: Icon(
              iconData,
              color: Colors.grey, // Unselected color
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              color: Colors.grey, // Unselected color
            ),
          ),
        ],
      ),
    );
  }
}
