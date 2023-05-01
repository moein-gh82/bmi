import 'package:flutter/material.dart';
import 'package:bmi/constants.dart';

class Reuseablecard extends StatelessWidget {
  final Color? color;
  final Widget? custom;
  final void Function()? onpressed;
  const Reuseablecard({super.key, this.color, this.custom, this.onpressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color ?? const Color(0xff1d1e33),
        ),
        child: custom,
      ),
    );
  }
}

class Iconcontent extends StatelessWidget {
  final String? label;
  final IconData? icon;

  const Iconcontent(this.icon, this.label, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        icon,
        size: 80,
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        label!,
        style: labeltextstyle,
      )
    ]);
  }
}

class Roundiconbutton extends StatelessWidget {
  final IconData? icon;
  final void Function() clickbutton;
  const Roundiconbutton(
      {super.key, required this.icon, required this.clickbutton});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(width: 56, height: 56),
      elevation: 6,
      fillColor: const Color(0xff4c4f5e),
      shape: const CircleBorder(),
      onPressed: clickbutton,
      child: Icon(icon),
    );
  }
}

class BottomBottun extends StatelessWidget {
  final String? title;
  final VoidCallback? ontap;
  const BottomBottun({super.key, required this.title, required this.ontap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        color: const Color(0xffeb1555),
        margin: const EdgeInsets.only(top: 10),
        height: 80,
        width: double.infinity,
        child: Center(
            child: Text(
          title!,
          style: largbuttontextstyle,
        )),
      ),
    );
  }
}
