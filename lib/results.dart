import 'package:bmi/constants.dart';
import 'package:bmi/reuseablecard.dart';
import 'package:flutter/material.dart';

class Resultpage extends StatelessWidget {
  final String? bmiresult, resulttext, interperitation;
  const Resultpage(
      {super.key,
      required this.bmiresult,
      required this.interperitation,
      required this.resulttext});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: titletextstyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reuseablecard(
              custom: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resulttext!.toUpperCase(),
                    style: resultstextstyle,
                  ),
                  Text(
                    bmiresult!,
                    style: bmitextstyle,
                  ),
                  const Column(
                    children: [
                      Text(
                        'Normal BMI Range:',
                        style: greybodytextstyle,
                      ),
                      Text(
                        '18.5 - 25 kg/m2',
                        style: TextStyle(fontSize: 22),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      interperitation!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 22),
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomBottun(
              title: 'RE_CALCULATE',
              ontap: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
