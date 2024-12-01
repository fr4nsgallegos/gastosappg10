import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gastosappg10/db/db_admin.dart';
import 'package:gastosappg10/widgets/busqueda_widget.dart';
import 'package:gastosappg10/widgets/item_gasto_widget.dart';
import 'package:gastosappg10/widgets/register_modal.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void showRegisterModal() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext contex) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: RegisterModal(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          DbAdmin db = DbAdmin();
          // db.initDatabase();
          db.insertarGasto();
          // db.obtenerGastos();
          // db.updGasto();
          // db.delGasto();
        }),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    showRegisterModal();
                  },
                  child: Container(
                    color: Colors.black,
                    height: 100,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Agregar",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Ingresa tus gatos",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Gestiona tus gastos de mejor forma",
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        BusquedaWidget(),
                        ItemGastoWidget(),
                        ItemGastoWidget(),
                        ItemGastoWidget(),
                        ItemGastoWidget(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 73,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
