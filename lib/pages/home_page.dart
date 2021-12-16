import 'package:flutter/material.dart';
import 'package:gastos_control/GoogleSheetsApi/gSheets_Api.dart';
import 'package:gastos_control/UI/top_card.dart';
import 'package:gastos_control/UI/transactions.dart';
import 'package:gastos_control/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.blanco,
        floatingActionButton: FloatingActionButton(
          // shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 2,
          backgroundColor: AppColors.primario.withOpacity(0.9),
          splashColor: AppColors.primario.withOpacity(0.9),
          hoverColor: AppColors.blanco,
          heroTag: 'add',
          child: const Icon(Icons.add, color: AppColors.blanco),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const TopCard(
                balance: '15,000',
                ingreso: '35,000',
                gasto: '20,000',
              ),
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount:
                                GoogleSheetsApi.currentTransactions.length,
                            itemBuilder: (context, index) {
                              return Transactions(
                                money: GoogleSheetsApi
                                    .currentTransactions[index][0],
                                nameTransaction: GoogleSheetsApi
                                    .currentTransactions[index][1],
                                gastoOIngreso: GoogleSheetsApi
                                    .currentTransactions[index][2],
                              );
                            }),
                      )

                      // child: Transactions(
                      //   nameTransaction: 'Netflix',
                      //   money: '196.00',
                      //   gastoOIngreso: 'Gasto',
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
