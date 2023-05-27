import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        body: GamePage(),
      ),
    ),
  );
}

class GamePage extends StatefulWidget {

  @override
  State<GamePage> createState() {
    return myGameState();
  }
}

class myGameState extends State<GamePage> {
  int leftBtn = 1;
  int rightBtn = 2;
  int clickCount= 0;
  int score = 0;
  void randme(){
    setState(() {
      leftBtn=Random().nextInt(3)+1;
      rightBtn=Random().nextInt(3)+1;
    }
    );
  }
  void incrementClickCount() {
    setState(() {
      clickCount++;
    });
  }
  void incrementScoreCount() {
    setState(() {
      if(this.leftBtn==2 && this.rightBtn==3){
        score++;
      }
      if(this.leftBtn==1 && this.rightBtn==2){
        score++;
      }
      if(this.leftBtn==3 && this.rightBtn==1){
        score++;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[400],
      appBar: AppBar(
        title: Center(child: Text('Rock Paper Scissors')),
        backgroundColor: Colors.indigo[400],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          this.leftBtn==this.rightBtn ? Center(child: Icon(Icons.e_mobiledata,size: 60,)) : Icon(null),
          this.leftBtn==2 && this.rightBtn==3 ? Center(child: Icon(Icons.thumb_up,size: 60,)) : Icon(null),
          this.leftBtn==1 && this.rightBtn==2 ? Center(child: Icon(Icons.thumb_up,size: 60,)) : Icon(null),
          this.leftBtn==3 && this.rightBtn==1 ? Center(child: Icon(Icons.thumb_up,size: 60,)) : Icon(null),
          this.leftBtn==3 && this.rightBtn==2 ? Center(child: Icon(Icons.thumb_down,size: 60,)) : Icon(null),
          this.leftBtn==2 && this.rightBtn==1 ? Center(child: Icon(Icons.thumb_down,size: 60,)) : Icon(null),
          this.leftBtn==1 && this.rightBtn==3 ? Center(child: Icon(Icons.thumb_down,size: 60,)) : Icon(null),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    randme();
                    incrementClickCount();
                    incrementScoreCount();
                    if (clickCount==12) {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.red,width: 2),
                            ),
                            child: Icon(Icons.close,size: 40,color: Colors.red,),
                          ),
                          SizedBox(height: 16,),
                          Text('END GAME',style: TextStyle(fontSize: 26,color: Colors.black,fontWeight: FontWeight.bold),),
                          SizedBox(height: 16,),
                          Text('YOUR SCORE IS: $score/12',style: TextStyle(color: Colors.black,fontSize: 22),),
                          SizedBox(height: 16,),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue
                            ),
                            child: TextButton(
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => GamePage()),
                                  );
                            },
                              child: Text('PLAY AGAIN',style: TextStyle(color: Colors.white,fontSize: 18),)
                            )
                          )
                        ],
                      ),
                    )
                    ),
                    );
                    }
                    },
                  child: Image.asset('images/btn$leftBtn.png'),
                ),
              ),
              Text('vs',style: TextStyle(fontSize: 24, color: Colors.white),),
              Expanded(
                child: TextButton(
                  onPressed: () {
                  },
                  child: Image.asset('images/btn$rightBtn.png'),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('You',style: TextStyle(fontSize: 20,color: Colors.yellow),),
              SizedBox(width: 40,),
              Text('System',style: TextStyle(fontSize: 20,color: Colors.yellow))
            ],
          )
              ],
      ),
    );
  }
}

