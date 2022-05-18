import 'package:flutter/material.dart';
import 'package:quiz_app/model_class_helper/question.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;
  bool pressed = false;

  //question list
  List questionBank = [
    Question.name(
        questionText: "Bangladesh became independent in 1971", isCorrect: true),
    Question.name(
        questionText: "Cofee is the main export of Bangladesh?",
        isCorrect: false),
    Question.name(
        questionText: "Rupee is the Main Currency of Bangladesh!",
        isCorrect: false),
    Question.name(
        questionText: "English is the national language of Bangladesh?",
        isCorrect: false),
    Question.name(
        questionText: "Rickshaw is a common mode of transport in Bangladesh!",
        isCorrect: true),
    Question.name(
        questionText: "Bangladesh is bigger than pakistan?", isCorrect: false),
    Question.name(
        questionText: "Tamim iqbal is the number 1 cricketer in Bangladesh?",
        isCorrect: false),
    Question.name(
        questionText: "Bangabandhu is called the Father of this nation!",
        isCorrect: true),
    Question.name(
        questionText: "Bangladesh is the third-largest muslim majority nation?",
        isCorrect: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff035956),
      //appbar
      appBar: AppBar(
        backgroundColor: Color(0xff035956),
        title: Text(
          "True Citizen Quiz",
          style: TextStyle(
              color: Colors.amber,
              letterSpacing: 2,
              wordSpacing: 2,
              fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        color: Color.fromARGB(0, 8, 107, 104),
        child: Column(
          children: [
            //image
            Container(
                padding: EdgeInsets.only(top: 8.0, bottom: 5.0),
                height: 300,
                width: 300,
                child: Image.asset("images/bd.png")
                /* decoration: BoxDecoration(
                   image: DecorationImage(image: NetworkImage("https://canopylab.com/wp-content/uploads/2020/05/Working-with-adaptive-quizzes-A-beginners-guide.jpg"))
                 ),
                 */
                ),

            //Asking question
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 120,
                width: MediaQuery.of(context).size.width * .4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  color: Colors.transparent,
                  border: Border.all(
                      color: Color(0xff000000),
                      style: BorderStyle.solid,
                      width: 2.0),
                ),
                child: Center(
                  child: Text(
                    questionBank[counter].questionText,
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
            ),
            //true false row
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 7.0),
              width: MediaQuery.of(context).size.width * .4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    //onPressed: _calculateAnswer(true),
                    child: Text(
                      "True",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    onPressed: () {
                      setState(() {
                        _calculateAnswer(true);
                        pressed = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.amber),
                  ),
                  ElevatedButton(
                    //onPressed: _calculateAnswer(false),
                    child: Text(
                      "False",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    onPressed: () {
                      setState(() {
                        _calculateAnswer(false);
                        pressed = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.amber),
                  ),
                  ElevatedButton(
                    onPressed: _nextQuestion,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.amber),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //increamenting index value of the List
  void _nextQuestion() {
    setState(() {
      counter++;
      if (counter == questionBank.length) {
        counter = 0;
      }
    });
  }

  // calculating Answer
  dynamic _calculateAnswer(bool userChoice) {
    setState(() {
      if (userChoice == questionBank[counter].isCorrect) {
        //debugPrint("Yes,u are right");
        snackBarCorrectContainer();
      } else {
        //debugPrint("incorrect");
        snackBarWrongContainer();
      }
    });
  }

  //Correct snackbar
  SnackBar snackBarCorrectContainer() {
    final snackBar = SnackBar(
      backgroundColor: Color(0xff035956),
      duration: Duration(milliseconds: 500),
      content: Container(
          height: 100,
          width: MediaQuery.of(context).size.width * 0.4,
          child: Center(
              child: const Text(
            'Correct Answer',
            style: TextStyle(fontSize: 30),
          ))),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return snackBar;
  }

  //wrong snackbar
  SnackBar snackBarWrongContainer() {
    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      duration: Duration(milliseconds: 500),
      content: Container(
          height: 20,
          width: MediaQuery.of(context).size.width * 0.4,
          child: Center(child: const Text('Wrong Answer'))),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return snackBar;
  }
}
