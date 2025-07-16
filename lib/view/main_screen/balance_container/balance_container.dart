import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../consts/text_lato.dart';
import '../../../utils/color_gradient.dart';
import '../../../view_model/controller/income_controller/income_controller.dart';

class BalanceContainer extends StatefulWidget {
  const BalanceContainer({super.key});

  @override
  State<BalanceContainer> createState() => _BalanceContainerState();
}

class _BalanceContainerState extends State<BalanceContainer> {
  final controller = Get.find<AddIncomeController>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      height: height * 0.25,
      decoration: BoxDecoration(
          gradient: ColorGradient.colorGradient(context),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                color: Colors.grey.shade300,
                offset: Offset(5, 5)
            )
          ]
      ),
      child: Column(
        children: [
          TextLato(
            text: 'Total Balance',
            color: Theme
                .of(context)
                .colorScheme
                .surface,
            fontSize: 18,
            fontWeight: FontWeight.bold,),
          SizedBox(height: 10,),
          Obx(() {
            return Text(
              'Rs. ${controller.totalBalance.value }', style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onPrimary
                )),);
          }),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_circle_up_rounded, color: Theme
                      .of(context)
                      .colorScheme
                      .surface,),
                  SizedBox(width: 5,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextLato(text: 'Income',
                        color: Theme
                            .of(context)
                            .colorScheme
                            .surface,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,),
                      Obx(() {
                        return Text('Rs. ${controller.income.value}',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Theme
                                      .of(context)
                                      .colorScheme
                                      .surface
                              )),);
                      }),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Icon(Icons.arrow_circle_down_rounded, color: Theme
                      .of(context)
                      .colorScheme
                      .surface,),
                  SizedBox(width: 5,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextLato(text: 'Expenses',
                        color: Theme
                            .of(context)
                            .colorScheme
                            .surface,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,),
                      Obx(() {
                        return Text('Rs. ${controller.totalExpense.value}',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Theme
                                      .of(context)
                                      .colorScheme
                                      .surface
                              )),);
                      }),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
