import 'package:flutter/material.dart';

import '../widgets/navbar_roots.dart';
// import 'home_screen.dart';

class Questions extends StatelessWidget {
  const Questions({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Questionnaire',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const QuestionPage(),
    );
  }
}

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => QuestionPageState();
}

class QuestionPageState extends State<QuestionPage> {
  List<String> questions = [
    "Little interest or pleasure in doing things?",
    "Feeling down, depressed, or hopeless?",
    "Trouble falling or staying asleep, or sleeping too much?",
    "Feeling tired or having little energy?",
    "Feeling worthless or guilty?",
    "Have thoughts of death or suicide?",
    "Have difficulty concentrating on things, such as reading the newspaper or watching television?",
    "Feeling restless or on edge?",
  ];

  int currentQuestionIndex = 0;
  List<String?> selectedAnswers = List.filled(8, null);

  void submitAnswer() {
    // Check if an option is selected
    if (selectedAnswers[currentQuestionIndex] == null) {
      // Show a snack-bar or message to prompt the user to select an option
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select an option.'),
        ),
      );
      return;
    }

    // Move to the next question or navigate to home screen when reaching the end
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        // Check if currentQuestionIndex is within the range of selectedAnswers list
        if (currentQuestionIndex < selectedAnswers.length) {
          selectedAnswers[currentQuestionIndex] = null; // Reset selected answer for the next question
        }
      });
    } else {
      // Navigate to the home screen after answering all questions
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NavBarRoots()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Questionnaire',
          style: TextStyle(
              color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        color: Colors.white, // Set background color to teal shade 100
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[currentQuestionIndex],
              textAlign: TextAlign.center,
              style:
              const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOption(text: 'Not at all', selectedValue: 'Not at all'),
                  _buildOption(
                      text: 'On Several days',
                      selectedValue: 'On Several days'),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOption(
                      text: 'More than half the days',
                      selectedValue: 'More than half the days'),
                  _buildOption(
                      text: 'Nearly every day',
                      selectedValue: 'Nearly every day'),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: submitAnswer,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption({required String text, required String selectedValue}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: () {
            setState(() {
              selectedAnswers[currentQuestionIndex] = selectedValue;
            });
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              selectedAnswers[currentQuestionIndex] == selectedValue
                  ? Colors.tealAccent // Change color to teal when selected
                  : Colors.teal,
            ),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23.0,
                color: selectedAnswers[currentQuestionIndex] == selectedValue
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
