import 'question.dart';

class QuestionsBrain {
  int _questionNumber = 0;

  final List<Question> _questionsBuffer = [
    Question(questionText: 'O sol é uma estrela.', questionAnswer: true),
    Question(questionText: 'Os pinguins podem voar.', questionAnswer: false),
    Question(
        questionText: 'A Terra é o terceiro planeta do sistema solar.',
        questionAnswer: true),
    Question(
        questionText: 'As girafas têm o pescoço mais curto que os elefantes.',
        questionAnswer: false),
    Question(
        questionText: 'Os peixes respiram através das brânquias.',
        questionAnswer: true),
    Question(
        questionText: 'O maior mamífero do mundo é a baleia azul.',
        questionAnswer: true),
    Question(
        questionText: 'Todos os ursos polares vivem na Antártica.',
        questionAnswer: false),
    Question(
        questionText: 'O canguru é um animal que vive na Austrália.',
        questionAnswer: true),
    Question(questionText: 'As abelhas fazem mel.', questionAnswer: true),
    Question(
        questionText: 'O mês de fevereiro sempre tem 30 dias.',
        questionAnswer: false),
    Question(
        questionText: 'As bananas crescem em árvores.', questionAnswer: false),
    Question(
        questionText: 'O oceano Pacífico é o maior oceano do mundo.',
        questionAnswer: true),
    Question(questionText: 'As aranhas têm seis patas.', questionAnswer: false),
    Question(
        questionText:
            'Os humanos têm cinco sentidos: visão, audição, olfato, paladar e tato.',
        questionAnswer: true),
    Question(
        questionText: 'As tartarugas podem viver por mais de 100 anos.',
        questionAnswer: true),
  ];

  int nextQuestion() {
    if (_questionNumber < _questionsBuffer.length - 1) {
      _questionNumber++;
    } else {
      _questionNumber = 0;
    }
    return _questionNumber;
  }

  String getQuestionText() {
    return _questionsBuffer[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionsBuffer[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionsBuffer.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset(){
    _questionNumber = 0;
  }
}
