import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Modal {
  shareCouponModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: _buildShareModalLayout(context),
          );
        });
  }
}

_buildShareModalLayout(BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Container(
        padding: EdgeInsets.all(20),
        height: 76,
        color: Colors.red[500],
//        decoration: BoxDecoration(
//            color: Colors.red[500],
//            borderRadius: BorderRadius.only(
//                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.close, color: Colors.white, size: 25,),
              onPressed: (){
                print("Clicked");
              },
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Stardust Movie",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.all(15),
        height: 120,
        color: Colors.black38,
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5),
                    width: 57,
                    height: 78,
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQBa9DWdFTqDYM8r7qYrQ715Dxjxd9VcZUK6g&usqp=CAU"), fit: BoxFit.cover),
                    ),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),),
                      onPressed: (){
                        print("clicked");
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text("Copy Link", style: TextStyle(color: Colors.pink),),
                ),
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5),
                    width: 57,
                    height: 78,
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(image: NetworkImage("https://www.facebook.com/images/fb_icon_325x325.png"), fit: BoxFit.cover),
                    ),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),),
                      onPressed: (){
                        print("clicked");
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text("Facebook", style: TextStyle(color: Colors.pink),),
                ),
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5),
                    width: 57,
                    height: 78,
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(image: NetworkImage("https://engineering.fb.com/wp-content/uploads/2018/06/messenger_wide_hero.jpg"),fit: BoxFit.cover),
                    ),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),),
                      onPressed: (){
                        print("clicked");
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text("Messenger", style: TextStyle(color: Colors.pink),),
                ),
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5),
                    width: 57,
                    height: 78,
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(image: NetworkImage("https://www.messengerpeople.com/wp-content/uploads/2019/09/messenger-overview-telegram.png",),fit: BoxFit.cover),
                    ),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),),
                      onPressed: (){
                        print("clicked");
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text("Telegram", style: TextStyle(color: Colors.pink),),
                ),
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5),
                    width: 57,
                    height: 78,
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(image: NetworkImage("https://lh3.googleusercontent.com/74iMObG1vsR3Kfm82RjERFhf99QFMNIY211oMvN636_gULghbRBMjpVFTjOK36oxCbs"), fit: BoxFit.cover),
                    ),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),),
                      onPressed: (){
                        print("clicked");
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text("Line", style: TextStyle(color: Colors.pink),),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
