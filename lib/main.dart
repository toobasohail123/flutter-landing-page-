
import 'package:flutter/material.dart';

void main() {
  runApp(const MindByteApp());
}

const Color navy = Color(0xFF10152F);
const Color purple = Color(0xFF7C3AED);
const Color blue = Color(0xFF38BDF8);
const Color pageColor = Color(0xFFF5F3FF);
const Color green = Color(0xFF16A34A);

class MindByteApp extends StatelessWidget {
  const MindByteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MindByte Quiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: purple),
        scaffoldBackgroundColor: pageColor,
        fontFamily: 'Roboto',
      ),
      home: const QuizHomePage(),
    );
  }
}

class QuizQuestion {
  final String question;
  final List<String> answers;
  final int correct;
  final String explanation;

  const QuizQuestion({
    required this.question,
    required this.answers,
    required this.correct,
    required this.explanation,
  });
}

const List<QuizQuestion> questions = [
  QuizQuestion(
    question: 'Flutter kis programming language ko use karta hai?',
    answers: ['Python', 'Dart', 'Java', 'C++'],
    correct: 1,
    explanation: 'Flutter apps banane ke liye Dart language use hoti hai.',
  ),
  QuizQuestion(
    question: 'HTML ka full form kya hai?',
    answers: [
      'Hyper Text Markup Language',
      'High Text Machine Language',
      'Home Tool Markup Language',
      'Hyperlinks Text Management Language',
    ],
    correct: 0,
    explanation: 'HTML web pages ka structure banane ke kaam aati hai.',
  ),
  QuizQuestion(
    question: 'CPU ka main function kya hai?',
    answers: [
      'Data print karna',
      'Computer ko cool karna',
      'Instructions process karna',
      'Internet connect karna',
    ],
    correct: 2,
    explanation: 'CPU instructions execute karta aur data process karta hai.',
  ),
  QuizQuestion(
    question: 'In mein se database ka example kaun sa hai?',
    answers: ['Flutter', 'MySQL', 'HTML', 'CSS'],
    correct: 1,
    explanation: 'MySQL ek relational database management system hai.',
  ),
  QuizQuestion(
    question: 'CSS ka use kis liye hota hai?',
    answers: [
      'Web page styling',
      'Data storage',
      'Virus scanning',
      'Operating system banana',
    ],
    correct: 0,
    explanation: 'CSS web pages ke colors, layout aur styling control karti hai.',
  ),
  QuizQuestion(
    question: 'Binary number system mein kaun se digits hote hain?',
    answers: ['1 aur 2', '0 se 9', '0 aur 1', '1 se 8'],
    correct: 2,
    explanation: 'Binary system sirf 0 aur 1 use karta hai.',
  ),
  QuizQuestion(
    question: 'RAM kis qisam ki memory hai?',
    answers: [
      'Permanent memory',
      'Volatile memory',
      'Optical memory',
      'External storage',
    ],
    correct: 1,
    explanation: 'RAM mein stored data power off hone par aam tor par mit jata hai.',
  ),
  QuizQuestion(
    question: 'Git ka main purpose kya hai?',
    answers: [
      'Photo editing',
      'Video streaming',
      'Version control',
      'Web browsing',
    ],
    correct: 2,
    explanation: 'Git code changes ko track aur manage karne mein help karta hai.',
  ),
];

class QuizHomePage extends StatefulWidget {
  const QuizHomePage({super.key});

  @override
  State<QuizHomePage> createState() => _QuizHomePageState();
}

class _QuizHomePageState extends State<QuizHomePage> {
  int questionIndex = 0;
  int score = 0;
  int? selectedAnswer;
  bool quizStarted = false;
  bool quizFinished = false;

  void startQuiz() {
    setState(() {
      questionIndex = 0;
      score = 0;
      selectedAnswer = null;
      quizStarted = true;
      quizFinished = false;
    });
  }

  void selectAnswer(int index) {
    if (selectedAnswer != null) return;

    setState(() {
      selectedAnswer = index;
      if (index == questions[questionIndex].correct) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (questionIndex < questions.length - 1) {
      setState(() {
        questionIndex++;
        selectedAnswer = null;
      });
    } else {
      setState(() {
        quizFinished = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF5F3FF), Color(0xFFE0F2FE)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  child: quizFinished
                      ? buildResultScreen()
                      : quizStarted
                          ? buildQuizScreen()
                          : buildHomeScreen(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHomeScreen() {
    return Column(
      key: const ValueKey('home'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: navy,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.psychology_alt_rounded,
                color: blue,
                size: 30,
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MindByte',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w900,
                      color: navy,
                    ),
                  ),
                  Text(
                    'LEARN • PLAY • GROW',
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 2,
                      color: purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.bolt_rounded, color: purple, size: 30),
          ],
        ),
        const SizedBox(height: 36),
        Container(
          padding: const EdgeInsets.all(26),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [navy, Color(0xFF312E81), purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: purple.withValues(alpha: 0.2),
                blurRadius: 24,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(milliseconds: 900),
                builder: (context, value, child) => Opacity(
                  opacity: value,
                  child: Transform.translate(
                    offset: Offset(0, 18 * (1 - value)),
                    child: child,
                  ),
                ),
                child: const Icon(
                  Icons.auto_awesome_rounded,
                  color: Color(0xFFFDE68A),
                  size: 42,
                ),
              ),
              const SizedBox(height: 22),
              const Text(
                'Ready to challenge\nyour brain?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  height: 1.2,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Test your Computer Science knowledge '
                'and become a tech master.',
                style: TextStyle(
                  color: Color(0xFFE0E7FF),
                  fontSize: 15,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 26),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton.icon(
                  onPressed: startQuiz,
                  icon: const Icon(Icons.play_arrow_rounded),
                  label: const Text(
                    'Start Quiz',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFFFDE68A),
                    foregroundColor: navy,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'YOUR LEARNING ZONE',
          style: TextStyle(
            color: navy,
            fontSize: 13,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 14),
        LayoutBuilder(
          builder: (context, constraints) {
            final wide = constraints.maxWidth > 480;
            final cardWidth = wide
                ? (constraints.maxWidth - 14) / 2
                : constraints.maxWidth;

            return Wrap(
              spacing: 14,
              runSpacing: 14,
              children: [
                SizedBox(
                  width: cardWidth,
                  child: infoCard(
                    Icons.quiz_rounded,
                    '8 Questions',
                    'Test your knowledge',
                    const Color(0xFF7C3AED),
                  ),
                ),
                SizedBox(
                  width: cardWidth,
                  child: infoCard(
                    Icons.code_rounded,
                    'CS Basics',
                    'Learn tech concepts',
                    const Color(0xFF0284C7),
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 24),
        const Center(
          child: Text(
            'Small steps. Big knowledge. 🚀',
            style: TextStyle(
              color: Color(0xFF64748B),
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }

  Widget infoCard(
    IconData icon,
    String title,
    String subtitle,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.12)),
        boxShadow: [
          BoxShadow(
            color: navy.withValues(alpha: 0.04),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: color, size: 26),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: navy,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildQuizScreen() {
    final question = questions[questionIndex];

    return Column(
      key: ValueKey('question_$questionIndex'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            IconButton.filledTonal(
              onPressed: () => setState(() {
                quizStarted = false;
                selectedAnswer = null;
              }),
              icon: const Icon(Icons.arrow_back_rounded),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'Computer Science Quiz',
                style: TextStyle(
                  color: navy,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 13,
                vertical: 9,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                'Score: $score',
                style: const TextStyle(
                  color: purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'QUESTION ${questionIndex + 1}',
              style: const TextStyle(
                color: purple,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.3,
              ),
            ),
            Text(
              '${questionIndex + 1}/${questions.length}',
              style: const TextStyle(
                color: Color(0xFF64748B),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: (questionIndex + 1) / questions.length,
            minHeight: 9,
            backgroundColor: Colors.white,
            color: purple,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: navy,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              const Icon(
                Icons.lightbulb_rounded,
                color: Color(0xFFFDE68A),
                size: 38,
              ),
              const SizedBox(height: 18),
              Text(
                question.question,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        ...List.generate(question.answers.length, (index) {
          final isSelected = selectedAnswer == index;
          final isCorrect = index == question.correct;
          final showResult = selectedAnswer != null;

          Color borderColor = Colors.white;
          Color background = Colors.white;
          Color textColor = navy;
          IconData? trailingIcon;

          if (showResult && isCorrect) {
            borderColor = green;
            background = const Color(0xFFDCFCE7);
            textColor = const Color(0xFF166534);
            trailingIcon = Icons.check_circle_rounded;
          } else if (isSelected && showResult) {
            borderColor = const Color(0xFFDC2626);
            background = const Color(0xFFFEE2E2);
            textColor = const Color(0xFF991B1B);
            trailingIcon = Icons.cancel_rounded;
          }

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(17),
                border: Border.all(
                  color: borderColor,
                  width: showResult && (isSelected || isCorrect) ? 2 : 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: navy.withValues(alpha: 0.035),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(17),
                  onTap: selectedAnswer == null
                      ? () => selectAnswer(index)
                      : null,
                  child: Padding(
                    padding: const EdgeInsets.all(17),
                    child: Row(
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: showResult && (isSelected || isCorrect)
                                ? borderColor.withValues(alpha: 0.15)
                                : pageColor,
                            borderRadius: BorderRadius.circular(11),
                          ),
                          child: Text(
                            String.fromCharCode(65 + index),
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Text(
                            question.answers[index],
                            style: TextStyle(
                              color: textColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        if (trailingIcon != null)
                          Icon(trailingIcon, color: textColor),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
        if (selectedAnswer != null) ...[
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: selectedAnswer == question.correct
                  ? const Color(0xFFDCFCE7)
                  : const Color(0xFFFFEDD5),
           
