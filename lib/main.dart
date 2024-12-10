import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const AgeCalculatorApp());
}

class AgeCalculatorApp extends StatelessWidget {
  const AgeCalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AgeCalculator(),
    );
  }
}

class AgeCalculator extends StatefulWidget {
  const AgeCalculator({Key? key}) : super(key: key);

  @override
  _AgeCalculatorState createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator> {
  final TextEditingController _yearController = TextEditingController();
  int _age = 0;
  DateTime _selectedDate = DateTime.now();

  void _calculateAge() {
    setState(() {
      int birthYear = _selectedDate.year;
      int currentYear = DateTime.now().year;
      _age = currentYear - birthYear;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _yearController.text = DateFormat.y().format(_selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Age Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _yearController,
              decoration: InputDecoration(
                labelText: 'Enter your birth year',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              readOnly: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateAge,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 18),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text('Calculate Age'),
            ),
            const SizedBox(height: 20),
            Text(
              'Your age is: $_age',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
