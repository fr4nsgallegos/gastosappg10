import 'package:flutter/material.dart';

class ItemGastoWidget extends StatelessWidget {
  const ItemGastoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        title: Text(
          "Cine",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Text(
          "2024-30-11",
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Text(
          "S/ 50.0",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: Image.asset(
          "assets/images/alimentos.webp",
          width: 40,
          height: 40,
        ),
      ),
    );
  }
}
