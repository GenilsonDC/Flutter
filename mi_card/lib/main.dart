import 'package:flutter/material.dart';
import 'mi_card/custom_colors/custom_colors.dart';

void main() {
  runApp(const MyAppCard());
}

class MyAppCard extends StatelessWidget {
  const MyAppCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: lightColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage('images/avatar.jpg'),
              ),
              Text(
                'Genilson',
                style: TextStyle(
                  fontFamily: 'GreatVibes',
                  fontSize: 50.0,
                  fontWeight: FontWeight.normal,
                  color:darkBlueColor,
                ),
              ),
              Text(
                'Desenvolvedor Mobile',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 25.0,
                  fontWeight: FontWeight.normal,
                  color: blueColor,
                  letterSpacing: 3.5,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                CircleAvatar(
                    backgroundColor: lightColor,
                    radius: 20.0,
                    backgroundImage: AssetImage('images/flutter.png'),
                  ),
                SizedBox(width: 20.0, height: 30.0,),
                CircleAvatar(
                    backgroundColor: lightColor,
                    radius: 20.0,
                    backgroundImage: AssetImage('images/react.png'),
                  )
                ],
              ),
              SizedBox(height: 20.0,
              width: 200.0,
              child: Divider(color: lightBlueColor,),),
             Card(
                color: blueColor,
                 margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                 child: ListTile(
                   leading: Icon(Icons.call_outlined,
                     color: lightColor,
                   ),
                   title: Text('+55 15 91232-1231',
                     textAlign: TextAlign.center,
                     style: TextStyle(
                         fontFamily: 'Montserrat',
                         fontSize: 17.0,
                         fontWeight: FontWeight.w700,
                         color: lightColor
                     )))),
            Card(
                color: blueColor,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                leading: Icon(Icons.email_outlined,
                    color: lightColor,
                    ),
                    title:
                    Text('genilsondocarmo@gmail.com',
                      textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                      color: lightColor
                    ),
                    ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
