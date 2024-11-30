import 'package:flutter/material.dart';
import 'package:gastosappg10/utils/data_general.dart';
import 'package:gastosappg10/widgets/field_modal_widget.dart';
import 'package:gastosappg10/widgets/item_type_widget.dart';

class RegisterModal extends StatefulWidget {
  @override
  State<RegisterModal> createState() => _RegisterModalState();
}

class _RegisterModalState extends State<RegisterModal> {
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  String typeSelected = "Alimentos";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          )),
      child: Column(
        children: [
          Text("Registra el gasto"),
          SizedBox(height: 24),
          FieldModalWidget(
              hint: "Ingresa el título", controller: titleController),
          FieldModalWidget(
              hint: "Ingresa el monto", controller: priceController),
          FieldModalWidget(
              hint: "Ingresa la fecha", controller: dateController),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: types
                  .map(
                    (e) => ItemTypeWidget(
                      data: e,
                      isSelected: typeSelected == e["name"],
                      tap: () {
                        typeSelected = e["name"];
                        setState(() {});
                      },
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
