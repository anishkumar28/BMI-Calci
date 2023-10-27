import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender = Gender.male;
  int height = 180;

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
                    child: ReusableCard(
                      colours: selectedGender == Gender.male ? kActiveCardColour : kInactiveCardColour,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(child: ReusableCard(
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
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
              colours: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT', style: kLabelTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text('cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
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
            const Expanded(child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard(
                  colours: kActiveCardColour,
                  cardChild: Column(
                    children: <Widget>[],
                  ),
                ),
                ),
                Expanded(child: ReusableCard(
                  colours: kActiveCardColour,
                  cardChild: Column(
                    children: <Widget>[],
                  ),
                ),
                ),
              ],
            )),
            Container(
              color: kBottomContainerColour,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            )
          ],
        )
    );
  }
}