import 'package:flutter/material.dart';

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionNumber = 0;

  List<Icon> scoreIcons = [];

  List<String> questions = [
    'O sol é uma estrela.',
    'Os pinguins podem voar.',
    'A Terra é o terceiro planeta do sistema solar.',
    'As girafas têm o pescoço mais curto que os elefantes.',
    'Os peixes respiram através das brânquias.',
    'O maior mamífero do mundo é a baleia azul.',
    'Todos os ursos polares vivem na Antártica.',
    'O canguru é um animal que vive na Austrália.',
    'As abelhas fazem mel.',
    'O mês de fevereiro sempre tem 30 dias.',
    'As bananas crescem em árvores.',
    'O oceano Pacífico é o maior oceano do mundo.',
    'As aranhas têm seis patas.',
    'Os humanos têm cinco sentidos: visão, audição, olfato, paladar e tato.',
    'As tartarugas podem viver por mais de 100 anos.',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions.first,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  foregroundColor: Colors.white),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  scoreIcons.add(
                    const Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  scoreIcons.add(
                    const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  );
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreIcons,
        ),
      ],
    );
  }
}

/*

1. **O sol é uma estrela.**   -true

2. **Os pinguins podem voar.**   - False

3. **A Terra é o terceiro planeta do sistema solar.**   - True

4. **As girafas têm o pescoço mais curto que os elefantes.**   - False

5. **Os peixes respiram através das brânquias.**   - True

6. **O maior mamífero do mundo é a baleia azul.**   - True

7. **Todos os ursos polares vivem na Antártica.**   - False

8. **O canguru é um animal que vive na Austrália.**   - True

9. **As abelhas fazem mel.**   - True

10. **O mês de fevereiro sempre tem 30 dias.**    - False

11. **As bananas crescem em árvores.**    - False (Elas crescem em plantas que parecem árvores, mas tecnicamente não são árvores.)

12. **O oceano Pacífico é o maior oceano do mundo.**    - True

13. **As aranhas têm seis patas.**    - False (Elas têm oito patas.)

14. **Os humanos têm cinco sentidos: visão, audição, olfato, paladar e tato.**    - True

15. **As tartarugas podem viver por mais de 100 anos.**    - True

*/
