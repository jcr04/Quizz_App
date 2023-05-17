import 'package:flutter/material.dart';
import '../models/question.dart';
import '../widgets/answer_button.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  final List<Question> _questions = [
    Question(
      question: 'What is the capital of Brazil?',
      options: ['São Paulo', 'Brasília', 'Rio de Janeiro', 'Salvador'],
      answerIndex: 1,
      score: 10,
    ),
    Question(
      question: 'What is the largest country in the world by area?',
      options: ['Russia', 'Canada', 'China', 'United States'],
      answerIndex: 0,
      score: 20,
    ),
    Question(
      question: 'What is the currency of Japan?',
      options: ['Yen', 'Dollar', 'Euro', 'Pound'],
      answerIndex: 0,
      score: 15,
    ),
    Question(
      question: 'What is the capital of Australia?',
      options: ['Sydney', 'Melbourne', 'Canberra', 'Brisbane'],
      answerIndex: 2,
      score: 25,
    ),
    Question(
      question: 'Which planet is known as the Red Planet?',
      options: ['Mars', 'Venus', 'Jupiter', 'Mercury'],
      answerIndex: 0,
      score: 30,
    ),
  ];

  void _answerQuestion(int selectedIndex) {
    if (selectedIndex == _questions[_currentQuestionIndex].answerIndex) {
      setState(() {
        _score++;
      });
    }

    if (_currentQuestionIndex == _questions.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ResultScreen(score: _score)),
      );
    } else {
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Question ${_currentQuestionIndex + 1}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              _questions[_currentQuestionIndex].question,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 40),
            Column(
              children: List.generate(
                _questions[_currentQuestionIndex].options.length,
                (index) => AnswerButton(
                  text: _questions[_currentQuestionIndex].options[index],
                  onPressed: () => _answerQuestion(index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
