import 'package:flutter/material.dart';
import 'package:gastos_control/utils/colors.dart';

class Transactions extends StatelessWidget {
  final String nameTransaction;
  final String money;
  final String gastoOIngreso;

  const Transactions({
    Key? key,
    required this.nameTransaction,
    required this.money,
    required this.gastoOIngreso,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          padding: const EdgeInsets.all(17),
          color: AppColors.neutro.withOpacity(0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.neutro,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.attach_money,
                        color: AppColors.blanco,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(nameTransaction,
                      style: const TextStyle(
                          fontSize: 18,
                          color: AppColors.blanco,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Text(
                (gastoOIngreso == 'Gasto' ? '-' : '+') + '\$' + money,
                style: TextStyle(
                    fontSize: 15,
                    color:
                        (gastoOIngreso == 'Gasto' ? Colors.red : Colors.green),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
