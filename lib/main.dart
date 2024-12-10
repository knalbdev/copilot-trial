import 'package:flutter/material.dart';

void main() {
  runApp(AgeCalculatorApp());
}

class AgeCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AgeCalculator(),
    );
  }
}

class AgeCalculator extends StatefulWidget {
  @override
  _AgeCalculatorState createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator> {
  final TextEditingController _yearController = TextEditingController();
  int _age = 0;

  void _calculateAge() {
    setState(() {
      int birthYear = int.parse(_yearController.text);
      int currentYear = DateTime.now().year;
      _age = currentYear - birthYear;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Age Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _yearController,
              decoration: InputDecoration(
                labelText: 'Enter your birth year',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateAge,
              child: Text('Calculate Age'),
            ),
            SizedBox(height: 20),
            Text(
              'Your age is: $_age',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}