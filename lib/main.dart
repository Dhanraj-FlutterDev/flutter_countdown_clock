import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Demo(),
    );
  }
}

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Countdown Clock'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Clock 1',style: TextStyle(fontSize: 50),),
            SlideCountdownClock(
                duration: Duration(hours: 1, minutes: 2, seconds: 2),
              shouldShowDays: true,
              slideDirection: SlideDirection.Up,
              separator: ':',
              textStyle: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
              padding: EdgeInsets.all(10),
              onDone: (){
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text('Clock 1 Finished')));
              },
            ),
            Divider(color: Colors.black,thickness: 1.0,),
            SizedBox(height: 50,),
            Text('Clock 2',style: TextStyle(fontSize: 50),),
            Padding(
                padding: EdgeInsets.all(10),
              child: SlideCountdownClock(
                  duration: Duration(milliseconds: 9000),
                separator: '-',
                slideDirection: SlideDirection.Down,
                shouldShowDays: true,
                textStyle: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                separatorTextStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
                padding: EdgeInsets.all(10),
                onDone: (){
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text('Clock 2 Finished'),
                    ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}














