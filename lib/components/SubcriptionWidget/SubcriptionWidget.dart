import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubcribtionWidget extends StatefulWidget {
  final String? value;
  final String? groupvalue;
  final String price;
  final Function(String? value) onToggle;
  final String title;
  final String recommeded;

  const SubcribtionWidget(
      {super.key,
      required this.price,
      required this.value,
      required this.groupvalue,
      required this.onToggle,
      required this.title,
      required this.recommeded});

  @override
  State<SubcribtionWidget> createState() => _SubcribtionWidgetState();
}

class _SubcribtionWidgetState extends State<SubcribtionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width * .93,
        height: Get.height * 0.07,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Center(
          child: ListTile(
              trailing: Text(
                widget.price,
                style: const TextStyle(fontSize: 10, fontFamily: 'OpenSauceOne'),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 9),
              title: Text(
                widget.title,
                style: const TextStyle(fontFamily: 'OpenSauceOne', fontSize: 12),
              ),
              leading: Radio<String?>(
                groupValue: widget.groupvalue,
                value: widget.value,
                onChanged: widget.onToggle,
              )),
        ));
  }
}
