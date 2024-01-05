import 'package:flutter/material.dart';
import 'package:medico_project/common/utils.dart';

class HomeScreen extends StatefulWidget {
  bool _isEarDropped = false;
  int earDropCount = 0;
  int eyeDropCount = 0;
  int handDropCount = 0;
  bool _isEyeDropped = false;
  bool _isHandDropped = false;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    int totalCount =  widget.earDropCount + widget.handDropCount + widget.eyeDropCount;
   
    return Scaffold(
      appBar: AppBar(
        title: Text('Medico'),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            Text('Your score: $totalCount /3', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DragTarget(
                  builder: (BuildContext context, List<dynamic> accepted,
                      List<dynamic> rejected) {
                    return widget._isEyeDropped ==false ? Image.asset(
                      'assets/images/eye.jpg',
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ) : Image.asset(
                      'assets/images/eye_sunglasses.png',
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    );
                  },
                  onWillAccept: (data) {
                    if(data != 'eye'){
                      showSnackBar(context, 'incorrect choice', false);
                      return false;
                    }else{
                      showSnackBar(context, 'Nice! correct choice', true);
                    return true;
                    }
                  },
                  onAccept: (data) {
                    setState(() {
                      widget._isEyeDropped = true;
                      widget.eyeDropCount = 1;
                    });
                  },
                ),
                Draggable(
                  data: 'hand',
                  feedback: Image.asset(
                    'assets/images/watch.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  child: Image.asset(
                    'assets/images/watch.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DragTarget(
                  builder: (BuildContext context, List<dynamic> accepted,
                      List<dynamic> rejected) {
                    return widget._isHandDropped == false ? Image.asset(
                      'assets/images/hand.png',
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ) : Image.asset(
                      'assets/images/wrist_watch.jpg',
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    );
                  },
                  onWillAccept: (data) {
                    if(data != 'hand'){
                      showSnackBar(context, 'incorrect choice', false);
                      return false;
                    }else{
                      showSnackBar(context, 'Nice! correct choice', true);
                    return true;
                    }
                  },
                  onAccept: (data) {
                    setState(() {
                      widget.handDropCount = 1;
                      widget._isHandDropped = true;
                      
                    });
                  },
                ),
                Draggable(
                  data: 'ear',
                  child: Image.asset(
                    'assets/images/earphones.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  feedback: Image.asset(
                    'assets/images/earphones.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  childWhenDragging: Container(),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DragTarget(
                  builder: (BuildContext context, List<dynamic> accepted,
                      List<dynamic> rejected) {
                    return widget._isEarDropped == false
                        ? Image.asset(
                            'assets/images/ear.png',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/images/ear_phones.png',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          );
                  },
                  onWillAccept: (data) {
                    if(data !='ear'){
                      showSnackBar(context, 'incorrect matching', false);
                      return false;
                    }else{
                      showSnackBar(context, 'Nice! correct choice', true);
                    return data == 'ear';
                    }
                  },
                  onAccept: (data) {
                    setState(() {
                      widget.earDropCount = 1;
                      widget._isEarDropped = true;
                    });
                  },
                  
                ),
                Draggable(
                  data: 'eye',
                  child: Image.asset(
                    'assets/images/sunglasses.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.contain,
                  ),
                  feedback: Image.asset(
                    'assets/images/sunglasses.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
