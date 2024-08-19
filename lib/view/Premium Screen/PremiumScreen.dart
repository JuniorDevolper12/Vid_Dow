import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/Buttons Widgets/Square Button/Buttonswidget.dart';
import '../../components/Gradient Widget/Main Gradient/Gradient Wigdet.dart';
import '../../components/SubcriptionWidget/SubcriptionWidget.dart';

class Premiumscreen extends StatefulWidget {
  const Premiumscreen({super.key});

  @override
  State<Premiumscreen> createState() => _PremiumscreenState();
}

class _PremiumscreenState extends State<Premiumscreen> {
  String? selectedoption = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GradientColor(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: SizedBox(
                    width: Get.width * 1,
                    height: Get.height * .35,
                    child: Image.asset('images/Premium.png')),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: Get.width * 0.3, top: Get.height * 0.001),
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset('images/Features.png'),
                ),
              ),
              SubcribtionWidget(
                recommeded: '',
                title: "Monthly",
                onToggle: (value) {
                  setState(() {
                    selectedoption = value;
                  });
                },
                value: 'Monthly',
                groupvalue: selectedoption,
                price: '\$3',
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height * 0.01),
                child: SubcribtionWidget(
                  recommeded: '',
                  title: 'Yearly',
                  onToggle: (value) {
                    setState(() {
                      selectedoption = value;
                    });
                  },
                  value: 'Monthly',
                  groupvalue: selectedoption,
                  price: '\$25',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: Get.height * 0.023,
                ),
                child: RoundButton(
                  title: 'Continue',
                  ontap: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
