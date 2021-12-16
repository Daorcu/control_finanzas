// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gastos_control/utils/colors.dart';

class TopCard extends StatelessWidget {
  final String balance;
  final String ingreso;
  final String gasto;

  const TopCard({
    Key? key,
    required this.balance,
    required this.ingreso,
    required this.gasto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('BALANCE',
                  style: TextStyle(color: AppColors.blanco, fontSize: 16)),
              Text(
                '\$' + balance,
                style: TextStyle(color: AppColors.blanco, fontSize: 40),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.verde,
                            ),
                            child: Center(
                                child: Icon(
                              Icons.arrow_downward,
                              color: AppColors.blanco,
                            ))),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Ingreso',
                                style: TextStyle(color: AppColors.blanco)),
                            SizedBox(height: 5),
                            Text('\$' + ingreso,
                                style: TextStyle(
                                    color: AppColors.blanco,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.secundario,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_upward,
                              color: AppColors.blanco,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Gasto',
                                style: TextStyle(color: AppColors.blanco)),
                            SizedBox(height: 5),
                            Text('\$' + gasto,
                                style: TextStyle(
                                    color: AppColors.blanco,
                                    fontWeight: FontWeight.bold)),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.primario.withOpacity(0.8),
            boxShadow: [
              BoxShadow(
                  color: AppColors.primario.withOpacity(0.7),
                  offset: Offset(4.0, 4.0),
                  blurRadius: 10.0,
                  spreadRadius: 1.0),
              BoxShadow(
                color: AppColors.blanco,
                offset: Offset(-4.0, -4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0,
              ),
            ]),
      ),
    );
  }
}
