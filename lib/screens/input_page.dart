import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});



  @override
  // ignore: library_private_types_in_public_api
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                     child: GestureDetector(
                        onTap: (){
                           setState(() {
                           selectedGender = Gender.male;
                         });
                     },
                    child: ReusableCard(
                      colours: selectedGender == Gender.male ? kActiveCardColour : kInactiveCardColour,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  ),
                  Expanded(
                    child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                    child: ReusableCard(
                    colours: selectedGender == Gender.female ? kActiveCardColour : kInactiveCardColour,
                    cardChild: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 80.0,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text('FEMALE', style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xFF8D8E98),
                        ),
                        ),
                      ],
                    ),
                  ),
                  ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
              colours: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('HEIGHT', style: kLabelTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text('cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 25.0),
                    ),
                    child: Slider(value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue){
                           setState(() {
                             height = newValue.round();
                           });
                           },
                    ),
                  ),
                ],
              ),
            ),
            ),
            Expanded(child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard(
                  colours: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                           RoundIconButton(
                             icon: FontAwesomeIcons.plus,
                             onTap: (){
                               setState(() {
                                 weight++;
                               });
                             },
                           ),
                        ],
                      ),
                    ],
                  ),
                ),
                ),
                Expanded(child: ReusableCard(
                  colours: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onTap: (){
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                         RoundIconButton(
                           icon: FontAwesomeIcons.plus,
                           onTap: (){
                             setState(() {
                               age++;
                             });
                           },
                         ),
                        ],
                      )
                    ],
                  ),
                ),
                ),
              ],
            ),
            ),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {

                CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Resultspage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResults(),
                    interpretation: calc.getInterpretation(),
                  )),
                );
              } ,
            ),
          ],
        )
    );
  }
}
