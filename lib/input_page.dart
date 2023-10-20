import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
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
                        colours: selectedGender == Gender.male ? activeCardColour : inactiveCardColour,
                        cardChild: const IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      colours: selectedGender == Gender.female ? activeCardColour : inactiveCardColour,
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
            Expanded(child: ReusableCard(
              colours: activeCardColour,
              cardChild: const Row(
                children: <Widget>[],
              ),
            ),
            ),
            Expanded(child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard(
                  colours: activeCardColour,
                  cardChild: const Column(
                    children: <Widget>[],
                  ),
                ),
                ),
                Expanded(child: ReusableCard(
                  colours: activeCardColour,
                  cardChild: const Column(
                    children: <Widget>[],
                  ),
                ),
                ),
              ],
            )),
            Container(
              color: bottomContainerColour,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        )
    );
  }
}