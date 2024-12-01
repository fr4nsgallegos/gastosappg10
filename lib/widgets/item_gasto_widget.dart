import 'package:flutter/material.dart';
import 'package:gastosappg10/models/gasto_model.dart';

class ItemGastoWidget extends StatelessWidget {
  // Map<String, dynamic> gasto;
  GastoModel gasto;
  ItemGastoWidget(this.gasto);

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
          gasto.title,
          // gasto["title"],
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Text(
          gasto.datetime,
          // gasto["datetime"] ?? "-",
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Text(
          "S/ ${gasto.price}",
          // "S/ ${gasto["price"]}",
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
