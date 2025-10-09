import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/practicingMaping/task_two/hive/hive_todo/todo_list/payment_config/config.dart';
import 'package:pay/pay.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String os = Platform.operatingSystem;

  var applePayButton = ApplePayButton(
    paymentConfiguration: PaymentConfiguration.fromJsonString(defaultApplePay), 
    paymentItems: const [
      PaymentItem(
      amount: ' 0.5', 
      label: 'item one')
    ]
  );

  var googlePay = GooglePayButton(
  paymentConfiguration: PaymentConfiguration.fromJsonString(defaultGooglePay), 
  paymentItems: [
    PaymentItem(
      label: 'Total',
      amount: '10.00',
      status: PaymentItemStatus.final_price,
    ),
  ],
  width: double.infinity,
    // height: 50,
    theme: GooglePayButtonTheme.dark,
    margin: EdgeInsets.all(5),// real estate api, dispatching api
    type: GooglePayButtonType.buy,
    onPaymentResult: (result) => print(result),
    loadingIndicator: const Center(child: CircularProgressIndicator(),),
);

  /**
   * GooglePayButton(
    paymentConfiguration: PaymentConfiguration.fromJsonString(defaultGooglePay), 
    paymentItems: const [
      PaymentItem(amount: '0.20', label: 'item two')
    ],

    width: double.infinity,
    // height: 50,
    theme: GooglePayButtonTheme.dark,
    margin: EdgeInsets.all(5),
    type: GooglePayButtonType.buy,
    onPaymentResult: (result) => print('object'),
    loadingIndicator: const Center(child: CircularProgressIndicator(),),
  );
   */


  @override
  Widget build(BuildContext context) {
    return  Column(
  children: [
   SizedBox(
    height: 60,
     child: Platform.isIOS ? applePayButton : googlePay,
   )
  ],
);

    
    // Scaffold(
    //   body: Padding(
    //     padding: const EdgeInsets.all(10),
    //       child: Center(
    //         child: Platform.isIOS ? applePayButton : googlePay,
    //       ),
    //     ),
    // );
  }
}