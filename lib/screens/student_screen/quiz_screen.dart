
import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question 1:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'What is the capital of France?',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black
              ),
            ),
            SizedBox(height: 16.0),
            OptionWidget(
              optionText: 'A. Paris',
              isSelected: true,
            ),
            OptionWidget(
              optionText: 'B. London',
            ),
            OptionWidget(
              optionText: 'C. Rome',
            ),
            OptionWidget(
              optionText: 'D. Berlin',
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add logic for button action
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

class OptionWidget extends StatefulWidget {
  final String optionText;
  final bool isSelected;

  OptionWidget({required this.optionText, this.isSelected = false});

  @override
  _OptionWidgetState createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: InkWell(
        onTap: () {
          // Add logic for option selection
        },
        child: Container(
          decoration: BoxDecoration(
            color: widget.isSelected ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          padding: EdgeInsets.all(12.0),
          child: Text(
            widget.optionText,
            style: TextStyle(
              fontSize: 16.0,
              color: widget.isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
