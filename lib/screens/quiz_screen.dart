import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import '../theme/app_colors.dart';

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _showResult = false;
  int? _selectedAnswerIndex;
  bool _isAnswered = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  late List<QuizQuestion> _shuffledQuestions;

  final List<QuizQuestion> _allQuestions = [
    QuizQuestion(
      question: 'Apa nama asli Fort Rotterdam sebelum direbut oleh Belanda?',
      options: ['Benteng Somba Opu', 'Benteng Ujung Pandang', 'Benteng Rotterdam', 'Benteng Tallo'],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: 'Bentuk arsitektur Fort Rotterdam dari atas menyerupai hewan apa?',
      options: ['Burung Garuda', 'Penyu', 'Naga', 'Ikan Paus'],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: 'Siapakah pahlawan nasional yang pernah diasingkan di Fort Rotterdam?',
      options: ['Sultan Hasanuddin', 'Kapitan Pattimura', 'Pangeran Diponegoro', 'Tuanku Imam Bonjol'],
      correctAnswerIndex: 2,
    ),
    QuizQuestion(
      question: 'Perjanjian apa yang menandai beralihnya penguasaan benteng ini ke VOC?',
      options: ['Perjanjian Renville', 'Perjanjian Bongaya', 'Perjanjian Linggarjati', 'Perjanjian Giyanti'],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: 'Museum apa yang saat ini berada di dalam kompleks Fort Rotterdam?',
      options: ['Museum La Galigo', 'Museum Balla Lompoa', 'Museum Kota Makassar', 'Museum Bahari'],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question: 'Pada tahun berapakah Fort Rotterdam pertama kali dibangun?',
      options: ['1545', '1667', '1802', '1945'],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question: 'Siapakah raja Gowa yang membangun benteng ini pertama kali?',
      options: ['Sultan Hasanuddin', 'Raja Gowa ke-9', 'Raja Gowa ke-10 (Imanrigau Daeng Bonto Karaeng Lakiung)', 'Arung Palakka'],
      correctAnswerIndex: 2,
    ),
    QuizQuestion(
      question: 'Apa nama gereja tua peninggalan Belanda yang ada di dalam benteng?',
      options: ['Gereja Katedral', 'Gereja Blenduk', 'Gereja Kerk', 'Gereja Ayam'],
      correctAnswerIndex: 2,
    ),
    QuizQuestion(
      question: 'Apa material utama yang awalnya digunakan untuk membangun benteng ini sebelum diubah menjadi batu bata oleh Belanda?',
      options: ['Tanah Liat', 'Kayu dan Batu Karang', 'Batu Granit', 'Bambu Karun'],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question: 'Siapa laksamana Belanda yang mengganti nama benteng ini menjadi Fort Rotterdam?',
      options: ['Jan Pieterszoon Coen', 'Herman Willem Daendels', 'Cornelis Speelman', 'Johannes van den Bosch'],
      correctAnswerIndex: 2,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _initQuiz();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _initQuiz() {
    _shuffledQuestions = List.from(_allQuestions)..shuffle();
  }

  void _answerQuestion(int selectedIndex) {
    if (_isAnswered) return;

    setState(() {
      _selectedAnswerIndex = selectedIndex;
      _isAnswered = true;

      if (selectedIndex == _shuffledQuestions[_currentQuestionIndex].correctAnswerIndex) {
        _score++;
        _audioPlayer.play(AssetSource('audio/correct.mp3'));
      } else {
        _audioPlayer.play(AssetSource('audio/wrong.mp3'));
      }
    });

    // Move to next question after a short delay
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          if (_currentQuestionIndex < _shuffledQuestions.length - 1) {
            _currentQuestionIndex++;
            _selectedAnswerIndex = null;
            _isAnswered = false;
          } else {
            _showResult = true;
          }
        });
      }
    });
  }

  void _restartQuiz() {
    setState(() {
      _initQuiz();
      _currentQuestionIndex = 0;
      _score = 0;
      _showResult = false;
      _selectedAnswerIndex = null;
      _isAnswered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.cream,
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 100.0, bottom: 32.0),
        child: _showResult ? _buildResultView() : _buildQuizView(),
      ),
    );
  }

  Widget _buildQuizView() {
    final currentQuestion = _shuffledQuestions[_currentQuestionIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Kuis Sejarah',
              style: GoogleFonts.spaceMono(
                color: AppColors.terracotta,
                fontSize: 14,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${_currentQuestionIndex + 1}/${_shuffledQuestions.length}',
              style: GoogleFonts.spaceMono(
                color: AppColors.stone,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Progress Bar
        LinearProgressIndicator(
          value: (_currentQuestionIndex + 1) / _shuffledQuestions.length,
          backgroundColor: AppColors.creamDark,
          color: AppColors.gold,
          minHeight: 8,
          borderRadius: BorderRadius.circular(4),
        ),
        const SizedBox(height: 48),
        // Question
        Text(
          currentQuestion.question,
          style: GoogleFonts.playfairDisplay(
            color: AppColors.dark,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 48),
        // Options
        Expanded(
          child: ListView.builder(
            itemCount: currentQuestion.options.length,
            itemBuilder: (context, index) {
              return _buildOptionButton(index, currentQuestion.options[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildOptionButton(int index, String text) {
    Color getBorderColor() {
      if (!_isAnswered) return AppColors.creamDark;
      if (index == _shuffledQuestions[_currentQuestionIndex].correctAnswerIndex) return Colors.green.shade600;
      if (index == _selectedAnswerIndex) return AppColors.terracotta;
      return AppColors.creamDark;
    }

    Color getBgColor() {
      if (!_isAnswered) return AppColors.white;
      if (index == _shuffledQuestions[_currentQuestionIndex].correctAnswerIndex) return Colors.green.shade50;
      if (index == _selectedAnswerIndex) return AppColors.terracotta.withOpacity(0.1);
      return AppColors.white;
    }

    IconData? getIcon() {
      if (!_isAnswered) return null;
      if (index == _shuffledQuestions[_currentQuestionIndex].correctAnswerIndex) return Icons.check_circle;
      if (index == _selectedAnswerIndex) return Icons.cancel;
      return null;
    }

    Color getIconColor() {
      if (index == _shuffledQuestions[_currentQuestionIndex].correctAnswerIndex) return Colors.green.shade600;
      return AppColors.terracotta;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: GestureDetector(
        onTap: () => _answerQuestion(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: getBgColor(),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: getBorderColor(),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  text,
                  style: GoogleFonts.crimsonPro(
                    color: AppColors.dark,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (getIcon() != null)
                Icon(
                  getIcon(),
                  color: getIconColor(),
                  size: 24,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultView() {
    String getMessage() {
      final double percentage = _score / _shuffledQuestions.length;
      if (percentage == 1.0) return 'Sempurna! Anda adalah ahli sejarah.';
      if (percentage >= 0.6) return 'Hebat! Pengetahuan Anda sangat baik.';
      return 'Terus belajar dan eksplorasi lagi!';
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          _score == _shuffledQuestions.length ? Icons.emoji_events : Icons.verified_user,
          size: 100,
          color: AppColors.gold,
        ),
        const SizedBox(height: 32),
        Text(
          'Kuis Selesai!',
          style: GoogleFonts.playfairDisplay(
            color: AppColors.dark,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Skor Anda',
          style: GoogleFonts.spaceMono(
            color: AppColors.stone,
            fontSize: 16,
            letterSpacing: 2.0,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '$_score / ${_shuffledQuestions.length}',
          style: GoogleFonts.playfairDisplay(
            color: AppColors.terracotta,
            fontSize: 64,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          getMessage(),
          textAlign: TextAlign.center,
          style: GoogleFonts.crimsonPro(
            color: AppColors.textBody,
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 64),
        ElevatedButton(
          onPressed: _restartQuiz,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.dark,
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
          ),
          child: Text(
            'ULANGI KUIS',
            style: GoogleFonts.spaceMono(
              color: AppColors.gold,
              fontSize: 14,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
