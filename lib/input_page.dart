import 'package:bmi/calculater.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/results.dart';
import 'package:bmi/reuseablecard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});
  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  Gender? selectedgenger;
  int height = 160;
  int weight = 70;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Reuseablecard(
                          onpressed: () {
                            setState(() {
                              selectedgenger = Gender.male;
                            });
                          },
                          color: selectedgenger == Gender.male
                              ? activecardcolor
                              : inactivecardcolor,
                          custom: const Iconcontent(
                            FontAwesomeIcons.mars,
                            'male',
                          ))),
                  Expanded(
                      child: Reuseablecard(
                    onpressed: () {
                      setState(() {
                        selectedgenger = Gender.female;
                      });
                    },
                    color: selectedgenger == Gender.female
                        ? activecardcolor
                        : inactivecardcolor,
                    custom: const Iconcontent(
                      FontAwesomeIcons.venus,
                      'female',
                    ),
                  ))
                ],
              ),
            ),
            Expanded(
                child: Reuseablecard(
                    custom: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'HEIGHT',
                  style: labeltextstyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: numbertextstyle,
                    ),
                    const Text(
                      'cm',
                      style: labeltextstyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      trackHeight: 1,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      overlayColor: const Color(0x1feb1555),
                      thumbColor: const Color(0xffeb1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 18),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30)),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newvalue) {
                        setState(() {
                          height = newvalue.round();
                        });
                      }),
                )
              ],
            ))),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Reuseablecard(
                    custom: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: labeltextstyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numbertextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Roundiconbutton(
                              icon: FontAwesomeIcons.plus,
                              clickbutton: () {
                                setState(() {
                                  weight = weight + 1;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Roundiconbutton(
                              icon: FontAwesomeIcons.minus,
                              clickbutton: () {
                                setState(() {
                                  weight = weight - 1;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: Reuseablecard(
                    custom: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: labeltextstyle,
                        ),
                        Text(
                          age.toString(),
                          style: numbertextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Roundiconbutton(
                              icon: FontAwesomeIcons.plus,
                              clickbutton: () {
                                setState(() {
                                  age = age + 1;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Roundiconbutton(
                              icon: FontAwesomeIcons.minus,
                              clickbutton: () {
                                setState(() {
                                  age = age - 1;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
            BottomBottun(
              title: 'CALCULATE',
              ontap: () {
                Calculator calculator =
                    Calculator(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Resultpage(
                              bmiresult: calculator.calculateBMI(),
                              interperitation: calculator.gerInterpretation(),
                              resulttext: calculator.getresult(),
                            )));
              },
            )
          ],
        ));
  }
}
